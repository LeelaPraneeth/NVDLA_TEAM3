import os
import math

#-----------------------------------------------------------------------------#
# List of all RAMDP_*/RAMPDP_* module names (without .v extension)
#-----------------------------------------------------------------------------#
ram_modules = [
    "RAMDP_128X11_GL_M2_E2", "RAMDP_128X6_GL_M2_E2", "RAMDP_16X256_GL_M1_E2",
    "RAMDP_16X272_GL_M1_E2", "RAMDP_16X64_GL_M1_E2",  "RAMDP_20X288_GL_M1_E2",
    "RAMDP_20X80_GL_M1_E2",  "RAMDP_256X4_GL_M2_E2",  "RAMDP_256X7_GL_M2_E2",
    "RAMDP_256X8_GL_M2_E2",  "RAMDP_32X16_GL_M1_E2",  "RAMDP_32X32_GL_M1_E2",
    "RAMDP_60X22_GL_M1_E2",  "RAMDP_64X10_GL_M2_E2",  "RAMDP_64X18_GL_M2_E2",
    "RAMDP_80X14_GL_M2_E2",  "RAMDP_80X15_GL_M2_E2",  "RAMDP_80X9_GL_M2_E2",
    "RAMDP_8X66_GL_M1_E2",

    "RAMPDP_128X18_GL_M2_D2",  "RAMPDP_128X256_GL_M1_D2", "RAMPDP_128X64_GL_M1_D2",
    "RAMPDP_160X144_GL_M2_D2", "RAMPDP_160X16_GL_M2_D2",  "RAMPDP_160X65_GL_M2_D2",
    "RAMPDP_160X82_GL_M2_D2",  "RAMPDP_248X144_GL_M2_D2", "RAMPDP_248X82_GL_M2_D2",
    "RAMPDP_256X11_GL_M4_D2",  "RAMPDP_256X144_GL_M2_D2", "RAMPDP_256X64_GL_M2_D2",
    "RAMPDP_256X80_GL_M2_D2",  "RAMPDP_32X192_GL_M1_D2",  "RAMPDP_32X224_GL_M1_D2",
    "RAMPDP_32X256_GL_M1_D2",  "RAMPDP_32X272_GL_M1_D2",  "RAMPDP_32X288_GL_M1_D2",
    "RAMPDP_512X40_GL_M4_D2",  "RAMPDP_512X64_GL_M4_D2",  "RAMPDP_512X72_GL_M4_D2",
    "RAMPDP_512X8_GL_M4_D2",   "RAMPDP_60X168_GL_M1_D2",  "RAMPDP_64X116_GL_M1_D2",
    "RAMPDP_64X160_GL_M1_D2",  "RAMPDP_64X224_GL_M1_D2",  "RAMPDP_64X226_GL_M1_D2",
    "RAMPDP_64X288_GL_M1_D2",  "RAMPDP_64X64_GL_M1_D2",   "RAMPDP_64X66_GL_M1_D2",
    "RAMPDP_80X16_GL_M2_D2",   "RAMPDP_80X226_GL_M1_D2",  "RAMPDP_80X256_GL_M1_D2",
    "RAMPDP_80X288_GL_M1_D2",  "RAMPDP_80X66_GL_M1_D2",   "RAMPDP_80X72_GL_M1_D2"
]

# output directory for generated .v files
output_dir = "generated_rams"
os.makedirs(output_dir, exist_ok=True)

def gen_signal_list(prefix, n):
    """Generate 'prefix_{n-1}, ..., prefix_0' comma-separated."""
    return ", ".join(f"{prefix}_{i}" for i in reversed(range(n)))

for mod in ram_modules:
    # parse depth/width from name, e.g. "RAMDP_128X11_GL_M2_E2"
    dims = mod.split("_")[1]
    depth, width = map(int, dims.split("X"))
    addr_w = math.ceil(math.log2(depth))

    RADR_list = gen_signal_list("RADR",   addr_w)
    WADR_list = gen_signal_list("WADR",   addr_w)
    WD_list   = gen_signal_list("WD",     width)
    RD_list   = gen_signal_list("RD",     width)

    vcode = f"""//-----------------------------------------------------------------------------
// DFF-based synthesizable wrapper for {mod}.v
// Automatically generated by generate_behavioral_rams.py
//----------------------------------------------------------------------------- 
module {mod} (
  // retention / power pins
  input        IDDQ,
  inout  wire  SVOP_0, SVOP_1, SVOP_2, SVOP_3,
              SVOP_4, SVOP_5, SVOP_6, SVOP_7,
  // sleep-mode enables
  input        SLEEP_EN_0, SLEEP_EN_1, SLEEP_EN_2, SLEEP_EN_3,
               SLEEP_EN_4, SLEEP_EN_5, SLEEP_EN_6, SLEEP_EN_7,
  input        RET_EN,

  // clocks
  input        CLK,
  input        CLK_R,
  input        CLK_W,

  // read/write enables
  input        RE,
  input        WE,

  // read address bits
  input  wire  {RADR_list},
  // write address bits
  input  wire  {WADR_list},

  // write data bits
  input  wire  {WD_list},
  // read data bits
  output reg   {RD_list}
);

  // Derived parameters
  localparam DEPTH      = {depth};
  localparam WIDTH      = {width};
  localparam ADDR_WIDTH = $clog2(DEPTH);

  // buses
  wire [ADDR_WIDTH-1:0] RA     = {{{RADR_list}}};
  wire [ADDR_WIDTH-1:0] WA     = {{{WADR_list}}};
  wire [WIDTH-1:0]      WD_bus = {{{WD_list}}};
  reg  [WIDTH-1:0]      RD_bus;

  // memory array
  reg [WIDTH-1:0] mem [0:DEPTH-1];

  // write port (uses CLK_W)
  always @(posedge CLK_W) begin
    if (WE) mem[WA] <= WD_bus;
  end

  // read port (uses CLK_R)
  always @(posedge CLK_R) begin
    if (RE) RD_bus <= mem[RA];
  end

  // drive outputs
  assign {{{RD_list}}} = RD_bus;

endmodule
"""

    # write the file
    path = os.path.join(output_dir, f"{mod}.v")
    with open(path, "w") as f:
        f.write(vcode)
    print("Generated", path)

