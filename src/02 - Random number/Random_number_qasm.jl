using PyCall

qiskit = pyimport("qiskit")

function random_int(backend, size)
	#Load circuit
	circuit = qiskit.QuantumCircuit.from_qasm_file("Random_number.qasm")
	job = qiskit.execute(circuit, backend, shots=size, memory=true)
	result = job.result()
	#Save result in string
	str = "0b"*join(result.get_memory())
	#Return base 10
	return parse(BigInt, str)
end

#QASM Simulator backend
backend = qiskit.Aer.get_backend("qasm_simulator")

bits = 64
print("Here you have a random number: ", random_int(backend, bits), "\n")
