uses crt; 
uses System;

var
  F_in, F_in1: file of char;
  F_out, F_out1: text;
  arr, arr1: array [0..100000] of char;
  n, time_in, time_out, time1_in, time1_out: integer;

function puzvoz: integer;
var
  c: char;
begin
  reset(F_in);
  for var i := 1 to n do
    read(F_in, arr[i]);
  for var i := 1 to n - 1 do
  begin
    for var j := n - 1 downto i do
    begin
      if arr[j] > arr[j + 1] then
      begin
        c := arr[j];
        arr[j] := arr[j + 1];
        arr[j + 1] := c;
      end;
    end;
  end;
  for var i := 1 to n do
    write(arr[i], ' ');
end;

function puzubv: integer;
var
  c: char;
begin
  reset(F_in);
  for var i := 1 to n do
    read(F_in, arr[i]);
  for var i := 1 to n - 1 do
  begin
    for var j := n - 1 downto i do
    begin
      if arr[j] < arr[j + 1] then
      begin
        c := arr[j];
        arr[j] := arr[j + 1];
        arr[j + 1] := c;
      end;
    end;
  end;
  for var i := 1 to n do
    write(arr[i], ' ');
end;

function bstrvoz(first,last: integer):integer;
var
  L, R: integer;
  X,c:char;
begin
  if first < last then
  begin
    X := arr1[(first + last) div 2];
    L := first;
    R := last;
    while L <= R do
    begin
      while arr1[L] < X do
        L := L + 1;
      while arr1[R] > X do
        R := R - 1;
      if L <= R then
      begin
        c := arr1[L];
        arr1[L] := arr1[R];
        arr1[R] := c;
        L := L + 1;
        R := R - 1;
      end;
    end;
    bstrvoz(first, R); 
    bstrvoz(L, last);
  end;
end;

function bstrubv(last,first: integer):integer;
var
  L, R: integer;
  X,c:char;
begin
  if first > last then
  begin
    X := arr1[(first + last) div 2];
    L := first;
    R := last;
    while L <= R do
    begin
      while arr1[L] < X do
        L := L + 1;
      while arr1[R] > X do
        R := R - 1;
      if L <= R then
      begin
        c := arr1[L];
        arr1[L] := arr1[R];
        arr1[R] := c;
        L := L + 1;
        R := R - 1;
      end;
    end;
    bstrubv(first, R); 
    bstrubv(L, last);
  end;
end;

function sort(n:integer): integer;
var
  a: integer;
begin
  ClrScr;
  writeln('Изменить сортировку?');
  writeln('Сортировка по возростанию "пузырьковым алгоритмом" - 1');
  writeln('Сортировка по убыванию "пузырьковым алгоритмом" - 2');
  writeln('Сортировка по возрастанию "быстрым алгоритмом" - 3');
  writeln('Сортировка по убыванию "быстрым алгоритмом" - 4');
  writeln('Выход - 0');
  readln(a);
  case a of
    1:
      begin
        time1_in := DateTime.Now.Second;
        time_in := DateTime.Now.MilliSecond;
        puzvoz;
        time1_out := DateTime.Now.Second;
        time_out := DateTime.Now.MilliSecond;
        writeln('Программа выполнялась ', time1_out - time1_in, ' секунд ', abs(time_out - time_in), ' милисекунду');
        readln;
        sort(n);
      end;
    2:
      begin
        time1_in := DateTime.Now.Second;
        time_in := DateTime.Now.MilliSecond;
        puzubv;
        time1_out := DateTime.Now.Second;
        time_out := DateTime.Now.MilliSecond;
        writeln('Программа выполнялась ', time1_out - time1_in, ' секунд ', abs(time_out - time_in), ' милисекунду');
        readln;
        sort(n);
      end;
    3:
      begin
        time1_in := DateTime.Now.Second;
        time_in := DateTime.Now.MilliSecond;
         reset(F_in1);
        for var i := 1 to n do
        begin
          read(F_in1, arr1[i]);
        end;
        bstrvoz(1,n);
        for var i := 1 to n do 
        begin
          write(arr1[i], ' ');
        end;
        time1_out := DateTime.Now.Second;
        time_out := DateTime.Now.MilliSecond;
        writeln('Программа выполнялась ', time1_out - time1_in, ' секунд ', abs(time_out - time_in), ' милисекунду');
        readln;
        sort(n);
      end;
    4:
      begin
           time1_in := DateTime.Now.Second;
        time_in := DateTime.Now.MilliSecond;
         reset(F_in1);
        for var i := 1 to n do
        begin
          read(F_in1, arr1[i]);
        end;
        bstrubv(1,n);
        for var i := 1 to n do 
        begin
          write(arr1[i], ' ');
        end;
        time1_out := DateTime.Now.Second;
        time_out := DateTime.Now.MilliSecond;
        writeln('Программа выполнялась ', time1_out - time1_in, ' секунд ', abs(time_out - time_in), ' милисекунду');
        readln;
        sort(n);
      end;
    0:
  end;
end;

function vvod: integer;
begin
  ClrScr;
  writeln('Введите размер массива');
  readln(n);
  assign(F_in, 'A:\Учёба\2 курс\Основы алгоритмизации и програмирования ЛР\ДКР№5\F_in.txt');
  assign(F_out, 'A:\Учёба\2 курс\Основы алгоритмизации и програмирования ЛР\ДКР№5\F_out.txt');
  assign(F_in1, 'A:\Учёба\2 курс\Основы алгоритмизации и програмирования ЛР\ДКР№5\F_in1.txt');
  assign(F_out1, 'A:\Учёба\2 курс\Основы алгоритмизации и програмирования ЛР\ДКР№5\F_out1.txt');
  writeln('Введите содержимое первого файли-массива');
  rewrite(F_in);
  var a: char;
  for var i := 1 to n do
  begin
    readln(a);
    write(F_in, a);
  end;
  rewrite(F_in1);
  writeln('Введите содержимое второго файла-массива');
  for var i := 1 to n do
  begin
    readln(a);
    write(F_in1, a);
  end;
  sort(n);
  rewrite(F_out);
  for var i:=1 to n do
  begin
    write(F_out,arr[i]);
  end;
  rewrite(F_out1);
  for var i:=1 to n do
  begin
    write(F_out1, arr1[i]);
  end;
end;

begin
  vvod;
  close(F_in1);
  close(F_out1);
  close(F_in); 
  close(F_out);
end.