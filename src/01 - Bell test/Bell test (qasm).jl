#Example for using qiskit in Julia using PyCall

using PyCall

qiskit = pyimport("qiskit")
plt = pyimport("matplotlib.pyplot")

qc = qiskit.QuantumCircuit.from_qasm_file("Bell test.qasm")
backend = qiskit.Aer.get_backend("qasm_simulator")
job = qiskit.execute(qc, backend, shots=2048)
result = job.result()

ax1 = qc.draw("mpl")
ax1.suptitle("Bell test circuit")
ax2 = visualization.plot_histogram(result.get_counts(qc))
ax2.suptitle("Results")
plt.show()
