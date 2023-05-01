

# Csaw 2018 Quals Boi


Notices two things the input is never used for the comparison and it has a buffer limit of 24, 
The thing thing is that the compare is with the variable *iStack36* and the stored string.

````c
int main(void)

{
  long in_FS_OFFSET;
  undefined8 input;
  undefined8 local_30;
  undefined4 local_28;
  int iStack36;
  undefined4 local_20;
  long local_10;
  
  local_10 = *(long *)(in_FS_OFFSET + 0x28);
  input = 0;
  local_30 = 0;
  local_20 = 0;
  local_28 = 0;
  iStack36 = L'\xdeadbeef';
  puts("Are you a big boiiiii??");
  read(0,&input,24);
  if (iStack36 == L'\xcaf3baee') {
    run_cmd("/bin/bash");
  }
  else {
    run_cmd("/bin/date");
  }
  if (local_10 != *(long *)(in_FS_OFFSET + 0x28)) {
                    /* WARNING: Subroutine does not return */
    __stack_chk_fail();
  }
  return 0;
}
````

What we most do is a bufferover flow attack