int g;
int c[100];
int erk(int a, int b)
{
  int i;
  int x = g;
  int ret = 0;

  for (i = 0; i < b; i++) {
    ret = ret * a;
    c[i] = ret;
  }

  return ret + x;
}
