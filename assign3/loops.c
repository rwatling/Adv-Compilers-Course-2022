#define N 512

int x[N];
int y[N];
int z[N];

int a[N][N];
int b[N][N];
int c[N][N];

double A[N][N][N];
double B[N][N][N];
double C[N][N][N];

void test1()
{
  unsigned i;

  for (i = 0; i < N; i++)
    x[i] = y[i]*2;
}

void test2()
{
  unsigned i;
  
  for (i = 0; i < N/2; i++)
    x[i+1] = y[2*i];
}

void test3()
{
  unsigned i;
  
  for (i = 1; i < N/2; i += 2)
    x[i-1] = y[2*i];
}

void test4()
{
  unsigned i;

  for (i = 0; i < N/4; i += 4)
    x[4*i] = y[2*i+5] + z[3*i];
}

void test5()
{
  unsigned i, j;

  for (i = 0; i < N; i++)
    for (j = 0; j < N; j++)
      a[i][j] = b[i][j]*3;
}

void test6()
{
  unsigned i, j;

  for (i = 0; i < N/2; i++)
    for (j = 0; j < N/2; j++)
      a[2*i][j] = b[i][i+j] + c[i][i];
}

void test7()
{
  unsigned i, j;

  for (i = 0; i < N/2; i += 2)
    for (j = 0; j < N/3; j++)
      a[2*i][j] = b[i][i+2*j+10] + c[i][3*j];
}

void test8()
{
  unsigned i, j;

  for (i = 0; i < N; i += 2)
    for (j = 0; j < N; j += 3)
      a[i][j] = b[j][i] + c[j][j];
}

void test9()
{
  unsigned i, j, k;

  for (i = 0; i < N-1; i++)
    for (j = 0; j < N; j++)
      for (k = 0; k < N/2-1; k++)
	A[i+1][j][k] = B[i][j][k+1] + C[i][j][2*k+1];
}

void test10()
{
  unsigned i, j, k;

  for (i = 0; i < N; i++)
    for (j = 0; j < N; j++)
      for (k = 0; k < N/2-1; k += 2)
	A[i][j][k] = B[k][j][k+1] + C[i][j][2*k+1];
}

void test11()
{
  unsigned i, j, k;

  for (i = 0; i < N; i++)
    for (j = 0; j < N; j++)
      for (k = 0; k < N/2; k += 4)
	A[i][k][j] = B[k][j][k+1] + C[i][j][2*k+1];
}

void test12()
{
  unsigned i, j, k;

  for (i = 0; i < N; i++)
    for (j = 0; j < N/2; j++)
      for (k = 0; k < N/8; k++)
	A[i][j+k][k] = B[i][j][5*k] + C[i][j][8*k];
}
