int a[128][128];

void test()
{
  int i, j;

  for (i = 0;  i < 128; i++)
    for (j = 0; j < 128; j++)
      {
	a[i][j] = a[i][2*j] + 10;
      }
}
