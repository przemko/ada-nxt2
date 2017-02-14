with Ada.Real_Time; use Ada.Real_Time;
with NXT; use NXT;
with NXT.AVR; use NXT.AVR;
with NXT.Last_Chance;
with NXT.Buttons; use NXT.Buttons;
with NXT.Display; use NXT.Display;

procedure Nim is
   
   procedure Welcome is
   begin
      Clear_Screen;
      Put("    NIM Game    ");
      Put("                ");
      Put("Control:        ");
      Put(" L/R move cursor");
      Put(" C   select     ");
      Put(" P   power off  ");
      Put("Press button... ");
   end Welcome;
   
   procedure Board is
   begin
      Clear_Screen;
      Put("       O        ");
      Put("      O O       ");
      Put("     O O O      ");
      Put("    O O O O     ");
      Put("   O O O O O    ");
      Put("  O O O O O O   ");
      Put(" O O O O O O O  ");
   end Board;
   
   procedure Heap(N : Integer) is
      R, C, C1, C2 : Integer;
   begin
      R := 0;
      C1 := 7;
      C2 := 7;
      C := C1;
      for I in 1..28-N loop
	 Set_Pos(C, R);
	 Put(" ");
	 -- oblicz nowe R i C:
	 if C = C2 then
	    R := R + 1;
	    C1 := C1 - 1;
	    C2 := C2 + 1;
	    C := C1;
	 else
	    C := C + 2;
	 end if;
      end loop;
   end Heap;
   
   procedure Menu(S : Integer ) is
   begin
      Set_Pos(2, 7);
      case S is
	 when 0 => Put("           ");
	 when 1 => Put("[1]  2   3 ");
	 when 2 => Put(" 1  [2]  3 ");
	 when 3 => Put(" 1   2  [3]");
	 when others => null;
      end case;
   end Menu;
   
   N, S : Integer;
   
begin
   delay until Clock + MilliSeconds(50);
   loop
      Welcome;
      loop
      	 if Current_Button = Power_Button then
	    Power_Down;
	 end if;
	 exit when Current_Button /= No_Button;
	 delay until Clock + Milliseconds(50);
      end loop;
      while Current_Button = Middle_Button loop
	 delay until Clock + Milliseconds(50);
      end loop;
      Board;
      N := 28;
      loop
	 -- Player Move:
	 S := 1;
	 Menu(S);
	 while Current_Button /= Middle_Button loop
	    if Current_Button = Power_Button then
	       Power_Down;
	    end if;
	    if Current_Button = Left_Button and S > 1 then
	       S := S - 1;
	       Menu(S);
	       delay until Clock + Milliseconds(100);
	       while Current_Button = Left_Button loop
		  delay until Clock + Milliseconds(50);
	       end loop;
	    elsif Current_Button = Right_Button and S < 3 and S < N then
	       S := S + 1;
	       Menu(S);
	       delay until Clock + Milliseconds(100);
	       while Current_Button = Left_Button loop
		  delay until Clock + Milliseconds(50);
	       end loop;
	    end if;
	    delay until Clock + Milliseconds(50);
	 end loop;
	 while Current_Button = Middle_Button loop
	    delay until Clock + Milliseconds(50);
	 end loop;
	 Menu(0);
	 N := N - S;
	 Heap(N);
	 if N = 0 then
	    Set_Pos(0, 5);
	    Put("I win! :)");
	    exit;
	 end if;
	 -- ComputerMove:
	 S := (N-1) mod 4;
	 if S = 0 then
	    S := 1;
	 end if;
	 N := N - S;
	 Heap(N);
	 if N = 0 then
	    Set_Pos(0, 5);
	    Put("You won...  :(");
	    exit;
	 end if;
      end loop;
      delay until Clock + Seconds(10);
   end loop;
end Nim;
