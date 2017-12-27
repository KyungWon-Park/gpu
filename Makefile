commons = parser.c

gpu = --compiler-options='-std=c11 -O3'

clean:
	rm *.out 

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

gpu:
	nvcc $(commons) $(gpu) main_gpu.c basic_gpu.cu -DBASIC-lm -O3 -o cnn_gpu_basic.out 
