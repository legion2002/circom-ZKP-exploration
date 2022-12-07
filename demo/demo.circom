pragma circom 2.0.0;


template Multiplier2 () {  

   signal input a;  
   signal input b;  
   signal output c;  
   
   c <== a * b;  
}

template Add2() {
    signal input a1;
    signal input a2;

    signal output out;
    out <== a1 + a2;
}

template MulAdd() {
    // circuit for (a + b) * c
    signal input a;
    signal input b;
    signal input c;
    
    signal output result;

    component mul;
    component add;

    mul = Multiplier2();
    add = Add2();

    add.a1 <== a;
    add.a2 <== b;
    mul.a <== add.out;
    mul.b <== c;

    result <== mul.c;

}

component main = MulAdd();