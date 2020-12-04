OPENQASM 2.0; //Version
include "qelib1.inc"; //Import gates

qreg q[2]; //Initializing two qubits and storing them in q
creg c[2]; //Initializing two bits and storing them in c

//Set qubits to |0〉
reset q[0];
reset q[1];

//Apply a Hadamard gate to qubit 0
//Quantum state of qubit 0 will be (|0〉 + |1〉)/√2, which creates a superposition
h q[0];
//Apply a CNOT gate to both qubits (flips q[1] to |1〉 if q[0] is |1〉)
cx q[0],q[1];
//Measure qubits and store the results in the classical bits
measure q[0] -> c[0];
measure q[1] -> c[1];

//Result: 50% probability of c[0]=0 and c[1]=1 and 50% probability of c[0]=1 and c[1]=1
