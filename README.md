# Classroom Fluorescent Tube Replacement Simulation

This Dart program simulates the replacement of fluorescent tubes in a classroom over the course of one year. It calculates the total number of broken tubes and the cost of the replaced tubes, based on certain parameters like usage hours, days per week, and months per year.

## Important Notes
- Not all replaced tubes are necessarily broken. Tubes are replaced in batches (e.g., when 2 tubes break in a unit, all tubes in that unit are replaced).  
  - This means that the **cost of replaced tubes** will likely be **higher than the cost of broken tubes**, as intact tubes may also be replaced during maintenance.

## Features
- Simulates the lifetime and breakage of fluorescent tubes in a classroom.
- Calculates the total cost of replacing broken tubes.
- Generates random expiration times for fluorescent tubes.

## How to Use
1. Copy the code into [DartPad](https://dartpad.dev/), an online editor for running Dart programs.
2. Click on the **Run** button in DartPad.
3. The output will display:
   - Total fluorescent tubes broken in a year.
   - Total cost for replacing the broken tubes.

## Example Output
Total fluorescent tubes broken in 1 year: 32
Total cost for replacing fluorescent tubes: $224

## Parameters
You can customize the following parameters in the `Classroom` class:
- `usedHoursPerDay`: Number of hours the classroom is used per day (default: 15).
- `usedDaysPerWeek`: Number of days the classroom is used per week (default: 5).
- `usedMonthsPerYear`: Number of months the classroom is used per year (default: 9).
- `tubeCost`: Cost of replacing one fluorescent tube (default: \$7).
- `unitsPerClassroom`: Number of tube units in the classroom (default: 4).
- `tubesPerUnit`: Number of fluorescent tubes per unit (default: 4).

## Verbose Output
For detailed output, including simulation details like broken tubes and expiration times, uncomment the print statements in the following methods:
- `calculateTubes`
- `_generateTubesExpirationHours`
- `_generateReplacedTubesExpirationHours`

This will provide insights into the internal workings of the simulation.

## Dependencies
This program does not require any external packages, but it uses Dart's built-in `Random` class for generating random values.

## License
This project is licensed under the MIT License.

