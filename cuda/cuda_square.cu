//first cuda program
//Hitender Prakash

#include <stdio.h>

//define gpu kernel

__global__ void square(double *d_out, double *d_in){
	int pos=threadIdx.x;
	d_out[pos]=d_in[pos]*d_in[pos];
}

int main(int argc, char **argv){
	if(argc <2 ||argc >2){
		printf("\nUsage: sqaure <size of array>");
		exit(0);
	}

	int siz=atoi(argv[1]);
	
	double *d_in, *d_out, *h_in, *h_out;
	
	h_in=(double *)malloc(siz*sizeof(double));
	h_out=(double *)malloc(siz*sizeof(double));
	
	for(int i=0;i<siz;i++){
		h_in[i]=i+1.0;
		h_out[i]=0.0;
	}
	
	//allocate space on GPU
	cudaMalloc((void**)&d_in, (size_t)siz*sizeof(double));
	int err= cudaGetLastError();
	
	cudaMalloc((void**)&d_out, (size_t)siz*sizeof(double));
	
	//copy from host to device
	cudaMemcpy(d_in, h_in, siz*sizeof(double), cudaMemcpyHostToDevice);
	square<<<1,siz>>>(d_out,d_in);
	cudaMemcpy(h_out, d_out, siz*sizeof(double), cudaMemcpyDeviceToHost);
	
	printf("\nBelow is the processed square values: ");
	for(int i=0;i<siz;i++){
		printf("\n%lf ----> %lf",h_in[i],h_out[i]);
	}	
	printf("\nLast cuda error in malloc: %d",err);
	printf("\n");
	return 0;
}
