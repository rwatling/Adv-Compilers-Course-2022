#define N 512

int x[N];
int y[N];

int a[N][N];
int b[N][N];

int A[N][N][N];
int B[N][N][N];

int s = 0;

void test1()
{
	unsigned i;

	for(i = 0; i < N; i++)
	   s += x[i];
}

void test2()
{
	unsigned i;

	for(i = 0; i < N; i++)
	  x[i] = y[i]+5;
}

void test3()
{
	unsigned i;

	for(i = 0; i < N; i+=2)
	  x[i] = x[i+1] + y[i] + y[i+1];
}

void test4()
{
	unsigned i;

	for(i = 0; i < N/2-1; i++)
	  x[2*i] = x[2*i+1] + y[i] + y[i+1];
}


void test5() /* homework question*/
{
	unsigned i,j;
	for(j = 0; j < N/2-1; j++)
		for(i = 1; i < N-1; i++)
		{
			a[2*j][i+1] = a[2*j][i]+b[i][j] + 10;
		        a[2*j+1][i] = a[2*j][i-1] + b[i+1][j];
		}
}

void test6() /* lecture notes question */
{
	unsigned i,j,k;

	for(i = 0; i < N; i++)
		for(j = 1; j < N; j++)
			for(k = 0; k < N; k++)
			{
				A[k][j][i] = A[k][j-1][i+1] + B[k][i][j];
			}
}

void test7() /* lecture notes question */
{
	unsigned i,j,k;

	for(i = 0; i < N-1; i++)
		for(j = 0; j < N-1; j++)
			for(k = 0; k < N; k++)
			{
				A[k][j][i] = B[k][j+1][i] + B[k][j][i] + B[k][j][i+1];
			}
}
