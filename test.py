import subprocess
import sys 
  
question_code = sys.argv[1]
input_path = "/".join(question_code.split("/")[::-1][1:][::-1]) + '/inputs/' + question_code.split("/")[-1] + '.in' 
with open(input_path, 'r') as input_file: 
     input_data = input_file.read()
  
test_cases = input_data.strip().split('\n\n') 
  
program_to_run =  question_code + '.py' 
for i, test_case in enumerate(test_cases, 1): 
     # TODO: Criar um arquivo de saída também para facilitar a depuração
     try:
          output = subprocess.check_output(['python3', f'{program_to_run}'], input=test_case, universal_newlines=True) 
     except subprocess.CalledProcessError as e:
          print(e.output)
          break

     print(f'### TEST {i}:\n') 
     print(output, '\n')