#makefile for compiling and running cuda square program
# hprakash@iu.edu

#compiling for NVIDEA
# makesure cudatoolkit module is loaded
# run module load cudatoolkit
COMPILER=nvcc
CFLAG=

# "make" command will only compile the code
all:
	@$(COMPILER) cuda_square.cu -o cuda_square.out $(CFLAG)

# "make run" command will compile ad run the code
run:
	@$(COMPILER) cuda_square.cu -o cuda_square.out $(CFLAG)
	@ aprun cuda_square.out 64

# "make clean" will remove the executable. Redirection used to supress error on console	
clean:
	@rm -rf *.out


