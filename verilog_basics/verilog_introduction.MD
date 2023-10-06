# What is Verilog

## Terminology

Verilog is an HDL(Hardware Description Language), it is used to model a piece of hardware. Circuits may be modeled in two 
ways, by their behavior or by there structure.
* **Behavior Modeling:** A component is described by its input/output response
* **Structured Modeling:** A component is described by its interconnecting lower-level components

### Behavior Modeling

In Behavior Modeling, you define only the functionality of the circuit, in the following example, there are the
implementation of a 2 to 4 decoder using this method of Modeling:

```verilog
module decoder_2x4 (
    input wire [1:0] A,
    output wire [3:0] Y
);

    assign Y[0] = (A == 2'b00) ? 1'b1 : 1'b0;
    assign Y[1] = (A == 2'b01) ? 1'b1 : 1'b0;
    assign Y[2] = (A == 2'b10) ? 1'b1 : 1'b0;
    assign Y[3] = (A == 2'b11) ? 1'b1 : 1'b0;

endmodule
```

### Structural Modeling

In Structural Modeling, both the functionalities, and structure of the code are specified, it can be seen in the 
following example:

```verilog
module decoder_2x4 (
    input wire [1:0] A,
    output wire [3:0] Y
);

    always @(*) begin
        case (A)
            2'b00: Y = 4'b0001;
            2'b01: Y = 4'b0010;
            2'b10: Y = 4'b0100;
            2'b11: Y = 4'b1000;
            default: Y = 4'b0000;
        endcase
    end

endmodule
```

**It is common to find elements of both Structural and Behavior Modeling in the same project**

### RTL (Register Transfer Level)

**What is it?**
* It is a common term that describes a style of Behavior Modeling. It defines the input-output relationships in 
dataflow operations inside your model.

After their creation, RTL constructs are Synthesizable.

**What is Synthesis?**
* Synthesis refers to the translation and optimization of a HDL code into a circuit of a particular technology
* So, RTL Systhesis refers to the translation of an RTL model into a optimized gate level implementation

## Syntax

* Verilog is case-sensitive 
* All keywords are lower case 
* Statements end with a semicolon ';'
* Single line comments begin with "//"
* Multi line comments begin with a "/*" and end with "*/"
* Empty spaces are used for readability


Modules starts with the keyword **module** and ends with **endmodule**. Every module is comprised of several parts,
the **port declarations**, the **data type declarations**, the **circuit functionality** and the **timing 
specifications**

### Module and port declaration

A module begins with the keyword **module**, followed by the name of the module, then there is the port list. The port 
list contains all the inputs, outputs and bidirectional connections to a module, the port list is in the parenthesis
right after the module name. 

After the port list is the port declaration section, which associates each of the ports with the port type, that could 
be: input, output or inout.
* input is used to input ports
* output is used to output ports
* inout is used to bidirectional ports

Port declarations are made in the following way:
* **<port_type> <port_name>;**

While declaring a bus, it is needed to add brackets containing the bus size, example: 
* **output [31..0] out;** 

Example of a declaration of an ULA:
```verilog
module ALU(
    input [31:0] A,         // 31-bit input A
    input [31:0] B,         // 31-bit input B
    input [3:0] function,   // 4-bit control signals for operation selection
    output reg [31:0] result,  // 31-bit result
    output reg Z,           // Zero flag
    output reg N            // Negative flag
);
(...)
endmodule
```

### Data type declaration
