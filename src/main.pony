use "debug"

use gl = "gl"
use glfw = "glfw"

actor Main
    new create(env: Env) =>
        let init = glfw.Init()
        Debug.out("init = ".add(init.string()))

        let window = glfw.CreateWindow(640, 480, "Hello World")
        Debug.out("window = ".add(window.usize().string()))
        
        if window.is_null() then
            glfw.Terminate()
        end
        
        glfw.MakeContextCurrent(window)
        
        while glfw.WindowShouldClose(window) == 0 do
            gl.Clear(gl.COLORBUFFERBIT())

            glfw.SwapBuffers(window)

            glfw.PollEvents()
        end
        
        glfw.Terminate()