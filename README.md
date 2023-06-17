# ESnet SmartNIC Bitfile Builder

**Author:** Mohammad Firas Sada

**License:** Apache 2.0

This script automates compiling the P4 artifacts for esnet-smartnic-hw.

## Compatibility and Testing

The ESnet SmartNIC P4 Compiler has been tested with the following versions of tools and commits:

- Tool versions:
  - Xilinx Vivado 2022.1.1
  - Xilinx Vivado 2023.1

- ESnet commit(s):
  - SHA256: c388436ae22c602363b745c590e09b77e9827b67
  - SHA256: c183e128a9a2a7d3d876e47107c5e7238c26a31b
  - SHA256: 01c283efb991529038cbcc7f429563db302f9c81

Please ensure that you have the compatible versions of the tools and ESnet commit(s) before using this script.

## Target Hardware

The ESnet SmartNIC Bitfile Builder has been used to target the following hardware:

- Alveo U280
- Alveo U55C

## Usage

To use the ESnet SmartNIC Bitfile Builder, run the script and follow the instructions provided. The script will automatically clone the esnet-smartnic-hw repo and copy your P4 program and populate the right Makefile settings and parameters.

Example usage:

```
./build.sh myprogram forwarder.p4
```

After the script is done running, you can cd into the newly-created program directory and run `make`.

Example output:

```
Cloning into 'esnet-smartnic-hw'...
remote: Enumerating objects: 3257, done.
remote: Counting objects: 100% (918/918), done.
remote: Compressing objects: 100% (506/506), done.
remote: Total 3257 (delta 499), reused 744 (delta 384), pack-reused 2339
Receiving objects: 100% (3257/3257), 1005.27 KiB | 5.29 MiB/s, done.
Resolving deltas: 100% (1941/1941), done.
Submodule 'esnet-fpga-library' (https://github.com/esnet/esnet-fpga-library) registered for path 'esnet-fpga-library'
Submodule 'open-nic-shell' (https://github.com/esnet/open-nic-shell) registered for path 'open-nic-shell'
Cloning into '/home/msada/Documents/dev/myprogram/esnet-smartnic-hw/esnet-fpga-library'...
Cloning into '/home/msada/Documents/dev/myprogram/esnet-smartnic-hw/open-nic-shell'...
Submodule path 'esnet-fpga-library': checked out 'a09797cab76a8ff035d2df11b33aee1d63b73703'
Submodule 'regio' (https://github.com/esnet/regio) registered for path 'esnet-fpga-library/tools/regio'
Submodule 'svunit' (https://github.com/svunit/svunit.git) registered for path 'esnet-fpga-library/tools/svunit'
Cloning into '/home/msada/Documents/dev/myprogram/esnet-smartnic-hw/esnet-fpga-library/tools/regio'...
Cloning into '/home/msada/Documents/dev/myprogram/esnet-smartnic-hw/esnet-fpga-library/tools/svunit'...
Submodule path 'esnet-fpga-library/tools/regio': checked out 'e92ae35796b77f9e3d47a7e34b4149d171b34681'
Submodule path 'esnet-fpga-library/tools/svunit': checked out '718852486c9726de636b9e5f16eb5759e3ea6634'
Submodule path 'open-nic-shell': checked out '034678b3c7b1ba822b33216b4c60ebb78532a433'

```


## Contributing and Collaboration

If you find the ESnet SmartNIC Bitfile Builder useful and would like to build upon it, you are welcome to contribute. Feel free to fork the repository, make modifications, and submit pull requests.

## License

The ESnet SmartNIC Bitfile Builder is licensed under the [Apache 2.0 License](https://www.apache.org/licenses/LICENSE-2.0).


