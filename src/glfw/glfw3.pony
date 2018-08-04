use "lib:gdi32" if windows
use "lib:shell32" if windows
use "lib:user32" if windows

use "lib:glfw/glfw3"

// Structs

primitive Monitor
primitive Window

// Functions

primitive CreateWindow
    fun @apply(width: I32, height: I32, title: String, monitor: Pointer[Monitor] = Pointer[Monitor], 
               share: Pointer[Window] = Pointer[Window]): Pointer[Window] =>
        @glfwCreateWindow[Pointer[Window]](width, height, title.cstring(), monitor, share)

primitive Init
    fun @apply(): Bool =>
        @glfwInit[Bool]()

primitive MakeContextCurrent
    fun @apply(window: Pointer[Window]): None =>
        @glfwMakeContextCurrent[None](window)

primitive PollEvents
    fun @apply(): None =>
        @glfwPollEvents[None]()

primitive SwapBuffers
    fun @apply(window: Pointer[Window]): None =>
        @glfwSwapBuffers[None](window)

primitive Terminate
    fun @apply(): None =>
        @glfwTerminate[None]()

primitive WindowShouldClose
    fun @apply(window: Pointer[Window]): I32 =>
        @glfwWindowShouldClose[I32](window)