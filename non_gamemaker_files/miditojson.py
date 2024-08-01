# Script to parse raw midi text data (midi.txt) as exported from Renoise 3.4.4 into JSON
# Imported MIDI should be set up to use channels 1-6,
#  where each channel corresponds to a button in the game. See channel_map below.

import json

def parse_midi_text(midi_content):
    # Split the input MIDI text into separate lines by looking for the newline character
    lines = midi_content.split('\n')
    # Initialize data
    tempo = 0
    time_signature = {"numerator": 0, "denominator": 0}
    notes = {
        "LEFT": [],
        "UP": [],
        "DOWN": [],
        "RIGHT": [],
        "A": [],
        "B": []
    }
    # Dictionary to map the MIDI channels to specific game note categories
    channel_map = {
        1: "LEFT",
        2: "UP",
        3: "DOWN",
        4: "RIGHT",
        5: "A",
        6: "B"
    }
    # Dictionary to store the start time of a note, to calculate note duration later when the note finishes
    note_start_time = {}

    for line in lines:
        # Removes leading/trailing whitespace and splits up the current line into an array containing each line_word or number in the line
        line_word = line.strip().split()
        # If the curreint line was empty, skip to the next one
        if not line_word:
            continue
        # Begin parsing
        if line_word[0] == 'MFile':
            continue
        elif line_word[0] == 'MTrk':
            current_channel = None
        elif line_word[0] == 'TrkEnd':
            continue
        elif line_word[1] == 'TimeSig':
            # Split the time signature, e.g. 4/4, in half based on the / symbol, and assign the left and right to the num/denom fields
            time_signature["numerator"], time_signature["denominator"] = map(int, line_word[2].split('/'))
        elif line_word[1] == 'Tempo':
            tempo = int(line_word[2]) # Extract the raw tempo, to be converted later when variable bpm is assigned
        elif line_word[1] in ['On', 'Off']:
            # Begin parsing each note,  by storing the current song time
            current_time = int(line_word[0])
            # Note 'On' event means the note has begun
            if line_word[1] == "On":
                # Converts string 'ch=#' to # and then casts it to an integer
                channel = int(line_word[2][3:])
                note_start_time[channel] = current_time
            # Note 'Off' event means the note has ended
            elif line_word[1] == "Off":
                channel = int(line_word[2][3:])
                # Get the note's start time from the dictionary
                start_time = note_start_time.pop(channel, None)
                if start_time is not None:
                    duration = current_time - start_time
                    note_data = {
                        "time": start_time,
                        "duration": duration
                    }
                    # Only store the data if the channel is in our map, i.e., what we want to process
                    if channel in channel_map:
                        notes[channel_map[channel]].append(note_data)

    # Convert the extracted tempo, which is stored in microseconds per quarter note
    bpm = round(60000000 / tempo)
    return {
        "tempo": bpm,
        "time_signature": time_signature,
        "notes": notes
    }

# Read the MIDI file
with open('midi.txt', 'r') as f:
    midi_content = f.read()

# Run the parse function
midi_data = parse_midi_text(midi_content)

# Convert to JSON
json_data = json.dumps(midi_data, indent=4)

# Save the JSON data to a file
output_file_path = 'midi_data.json'
with open(output_file_path, 'w') as f:
    f.write(json_data)

print("Parsing finished: midi_data.json has been created.")