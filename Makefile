commons = parser.c

gpu = --compiler-options='-std=c11 -O3'

clean:
	rm *.out *.o

test1:
	gcc $(commons) unitTest_parser.c -o test_parser.out 

test2:
	gcc $(commons) unitTest_parser2.c -o test2_parser.out

cpu:
	gcc $(commons) main_cpu.c -lm -O3 -o cnn_cpu.out 

cpu_debug:
	gcc $(commons) main_cpu_debug.c -lm -g -o cnn_cpu_db.out 

cpu_debug_exe:
	gcc $(commons)  main_cpu.c -lm -g -o cnn_cpu_db_exe.out 

gpu: cuda_code.o
	gcc $(commons) main_gpu.c -std=c11 -DBASIC -O3 -o cnn_gpu_basic.out 

cuda_code.o:
	nvcc -c basic_gpu.cu -O3 -o cuda_code.o 
