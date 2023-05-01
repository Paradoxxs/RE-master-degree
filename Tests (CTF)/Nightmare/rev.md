program : https://github.com/guyinatuxedo/nightmare/tree/master/modules/03-beginner_re/helithumper_re


Main function the validate function must not return *0* or we failed
````c
bool main(void)

{
  int iVar1;
  char *input;
  
  input = (char *)calloc(0x32,1);
  puts(s_Welcome_to_the_Salty_Spitoon_,_H_00102008);
  __isoc99_scanf("%s",input);
  iVar1 = validate(input);
  if (iVar1 == 0) {
    puts(s_Yeah_right._Back_to_Weenie_Hut_J_);
  }
  else {
    puts("Right this way...");
  }
  return iVar1 == 0;
  ````



Locate the flag inside the array *local_48* flag{HuCf_lAb}

`````c

int validate(char *param_1)

{
  int return_var;
  size_t input_lenght;
  long in_FS_OFFSET;
  int cnt;
  int local_48 [4];
  undefined4 local_38;
  undefined4 local_34;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_14;
  long local_10;
  
  local_10 = *(long *)(in_FS_OFFSET + 0x28);
  local_48[0] = L'f';
  local_48[1] = L'l';
  local_48[2] = L'a';
  local_48[3] = L'g';
  local_38 = L'{';
  local_34 = L'H';
  local_30 = L'u';
  local_2c = L'C';
  local_28 = L'f';
  local_24 = L'_';
  local_20 = L'l';
  local_1c = L'A';
  local_18 = L'b';
  local_14 = L'}';
  input_lenght = strlen(param_1);
  cnt = 0;
  do {
    if ((int)input_lenght <= cnt) {
      return_var = 1;
LAB_001012b7:
      if (local_10 != *(long *)(in_FS_OFFSET + 0x28)) {
                    /* WARNING: Subroutine does not return */
        __stack_chk_fail();
      }
      return return_var;
    }
    if ((int)param_1[cnt] != local_48[cnt]) {
      return_var = 0;
      goto LAB_001012b7;
    }
    cnt = cnt + 1;
  } while( true );
}
````