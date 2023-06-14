void test()
{
    int a=10;
}

void main()
{
    char *video_mem = (char *)0xb8000;
    *video_mem = 'C';
}