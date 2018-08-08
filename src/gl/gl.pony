use "lib:opengl32" if windows

// Data Types

type BOOLEAN  is Bool
type BITFIELD is I32
type BYTE     is I8
type CLAMPF   is F32   // must be between 0 - 1
type CLAMPD   is F64   // must be between 0 - 1
type DOUBLE   is F64
type ENUM     is I32
type FIXED    is I32   // must be a 16.16 integer
// type FLOAT is F32   // this conflicts, and so we use F32 in the signatures
type HALF     is F32   // must be a 16bit float
// type INT   is I32   // this conflicts, and so we use I32 in the signatures
type INT64    is I64
type INTPTR   is ISize
type SHORT    is I16
type SIZEI    is I32
type SIZEIPTR is ISize
type UBYTE    is U8
type UINT     is U32
type UINT64   is U64
type USHORT   is U16
type VOID     is Pointer[U8] tag

// Enum - Booleans

primitive BOOLEANFALSE
    fun apply(): Bool => false

primitive BOOLEANTRUE
    fun apply(): Bool => true

// Enum - Error Codes

// TODO

// Enum - Masks

primitive MASKACCUMBUFFERBIT
    fun apply(): I32 => 512

primitive MASKCOLORBUFFERBIT
    fun apply(): I32 => 16384

primitive MASKDEPTHBUFFERBIT
    fun apply(): I32 => 256

primitive MASKSTENCILBUFFERBIT
    fun apply(): I32 => 1024

// Enum - Modes

primitive MODELINELOOP
    fun apply(): I32 => 2

primitive MODELINES
    fun apply(): I32 => 1

primitive MODELINESTRIP
    fun apply(): I32 => 3

primitive MODEPOINTS
    fun apply(): I32 => 0

primitive MODEPOLYGON
    fun apply(): I32 => 9

primitive MODEQUADS
    fun apply(): I32 => 7

primitive MODEQUADSTRIP
    fun apply(): I32 => 8

primitive MODETRIANGLEFAN
    fun apply(): I32 => 6

primitive MODETRIANGLES
    fun apply(): I32 => 4

primitive MODETRIANGLESTRIP
    fun apply(): I32 => 5

// Enum - Targets

primitive TARGETARRAYBUFFER
    fun apply(): I32 => 34962

primitive TARGETELEMENTARRAYBUFFER
    fun apply(): I32 => 34963

primitive TARGETPIXELPACKBUFFER
    fun apply(): I32 => 35051

primitive TARGETPIXELUNPACKBUFFER
    fun apply(): I32 => 35052

// Enum - Types

primitive TYPEBYTE
    fun apply(): I32 => 5120

primitive TYPEDOUBLE
    fun apply(): I32 => 5130

primitive TYPEFLOAT
    fun apply(): I32 => 5126

primitive TYPEINT
    fun apply(): I32 => 5124

primitive TYPESHORT
    fun apply(): I32 => 5122

primitive TYPEUNSIGNEDBYTE
    fun apply(): I32 => 5121

primitive TYPEUNSIGNEDINT
    fun apply(): I32 => 5125

primitive TYPEUNSIGNEDSHORT
    fun apply(): I32 => 5123

// Enum - Usages

primitive USAGESTATICDRAW
    fun apply(): I32 => 35044

// TODO

// Structs

struct Buffers
struct Sync

// Functions

primitive BindBuffer
    fun @apply(target: ENUM, buffer: UINT): None =>
        let glBindBuffer = @wglGetProcAddress[@{(ENUM, UINT)}]("glBindBuffer".cstring())
        glBindBuffer(target, buffer)

primitive BindVertexArray
    fun @apply(array: UINT): None =>
        let glBindVertexArray = @wglGetProcAddress[@{(UINT)}]("glBindVertexArray".cstring())
        glBindVertexArray(array)

primitive BufferData
    fun @apply(target: ENUM, size: SIZEIPTR, data: Array[F32], usage: ENUM): None =>
        let glBufferData = @wglGetProcAddress[@{(ENUM, SIZEIPTR, Pointer[F32] tag, ENUM)}]("glBindBuffer".cstring())
        glBufferData(target, size, data.cpointer(), usage)

primitive Clear
    fun @apply(mask: BITFIELD): None =>
        @glClear[None](mask)

primitive ClearColor
    fun @apply(red: CLAMPF, green: CLAMPF, blue: CLAMPF, alpha: CLAMPF): None =>
        @glClearColor[None](red, green, blue, alpha)

primitive DisableVertexAttribArray
    fun @apply(index: UINT): None =>
        let glDisableVertexAttribArray = @wglGetProcAddress[@{(UINT)}]("glDisableVertexAttribArray".cstring())
        glDisableVertexAttribArray(index)

primitive DrawArrays
    fun @apply(mode: ENUM, first: I32, count: SIZEI): None =>
        let glDrawArrays = @wglGetProcAddress[@{(ENUM, I32, SIZEI)}]("glDrawArrays".cstring())
        glDrawArrays(mode, first, count)

primitive EnableVertexAttribArray
    fun @apply(index: UINT): None =>
        let glEnableVertexAttribArray = @wglGetProcAddress[@{(UINT)}]("glEnableVertexAttribArray".cstring())
        glEnableVertexAttribArray(index)

primitive GenBuffers
    fun @apply(n: SIZEI, buffers: Array[UINT]): None =>
        let glGenBuffers = @wglGetProcAddress[@{(SIZEI, Pointer[U32] tag)}]("glGenBuffers".cstring())
        glGenBuffers(n, buffers.cpointer())

primitive GenVertexArrays
    fun @apply(n: SIZEI, arrays: Array[UINT]): None =>
        let glGenVertexArrays = @wglGetProcAddress[@{(SIZEI, Pointer[U32] tag)}]("glGenVertexArrays".cstring())
        glGenVertexArrays(n, arrays.cpointer())

primitive GetError
    fun @apply(): ENUM =>
        @glGetError[ENUM]()

primitive UseProgram
    fun @apply(program: UINT): None =>
        let glUseProgram = @wglGetProcAddress[@{(UINT)}]("glUseProgram".cstring())
        glUseProgram(program)

primitive VertexAttribPointer
    fun @apply(index: UINT, size: I32 = 4, dataType: ENUM = TYPEFLOAT(), normalized: BOOLEAN = BOOLEANFALSE(), 
               stride: SIZEI = 0, pointer: I32 = 0): None =>
        let glVertexAttribPointer = @wglGetProcAddress[@{(UINT, I32, ENUM, BOOLEAN, SIZEI, I32)}]
            ("glVertexAttribPointer".cstring())
        glVertexAttribPointer(index, size, dataType, normalized, stride, pointer)
        