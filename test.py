import subprocess as sub 
import sys 
  
question_code = sys.argv[1]
input_path = 'inputs/' + question_code.split("/")[-1] + '.in' 
with open(input_path, 'r') as input_file: 
     input_data = input_file.read()
  
test_cases = input_data.strip().split('\n\n') 
  
program_to_run =  question_code + '.py' 
for i, test_case in enumerate(test_cases, 1): 
    output = sub.check_output(['python3', f'{program_to_run}'], input=test_case, universal_newlines=True) 

    print(f'### TEST {i}:\n') 
    print(output, '\n')