use "lib:opengl32" if windows

// Constants

primitive COLORBUFFERBIT
    fun apply(): I32 => 16384

// Functions

primitive Clear
    fun @apply(mask: I32): None =>
        @glClear[None](mask)
