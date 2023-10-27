import argparse
from pathlib import Path
import numpy as np
import csv

def convert_text_to_csv(input_file):
    # Define the header for the CSV file
    header = ["N1","Date1", "Time1", "Signal1", "N2","Date2", "Time2", "Signal2"]

    # Read the input text file
    with open(input_file, 'r') as text_file:
        lines = text_file.readlines()

    # Compute delta t across both
    #line[2] =  delta t	8.000000E-6		8.000000E-6	
    delta_t_index = 2
    dt1, dt2 = map(np.float64,lines[2].split()[-2:])
    dt1 = dt2 = 1
    
    TimeList1 = [i*dt1 for i in range(len(lines))]
    TimeList2 = [i*dt2 for i in range(len(lines))]
    
    conv_to_float = lambda x: np.float64(x) if 'E' in x else x
    # (* TimeList1, Date1, Time1, Signal1, TimeList2, Date2, Time2, Signal2 *)
    # (* 0,         1    , 2    , 3      , 4        , 5    , 6    , 7       *)

    # Set start_index to 5 (assuming that the header always starts at line 6)
    start_index = 5
    
    # Extract data lines and split them into two rows
    data_lines = lines[start_index:]
    rows = [list(map(conv_to_float,line.split())) for line in data_lines]
    csv_data = [[TimeList1[i]] + row[:3] + [TimeList2[i]] + row[3:] for i,row in enumerate(rows)]


    # Generate the output CSV file name in the same directory as the input file
    output_csv = input_file.parent / (input_file.stem + ".csv")

    # Write the data to the output CSV file
    with open(output_csv, 'w', newline='') as csv_file:
        csv_writer = csv.writer(csv_file)
        csv_writer.writerow(header)
        csv_writer.writerows(csv_data)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Convert text files to CSV")
    parser.add_argument("input_files", type=Path, nargs='+', help="Input text files (e.g., './part-1/*.txt')")
    args = parser.parse_args()

    for input_file in args.input_files:
        if input_file.is_file() and input_file.suffix == ".txt":
            convert_text_to_csv(input_file)
