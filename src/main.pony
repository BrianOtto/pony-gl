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
        
        var positionBufferObject: Array[gl.UINT] = [0]
        gl.GenBuffers(1, positionBufferObject)
        Debug.out("error1 = ".add(gl.GetError().string()))

    	try gl.BindBuffer(gl.TARGETARRAYBUFFER(), positionBufferObject(0)?) end
    	Debug.out("error2 = ".add(gl.GetError().string()))
    	
    	var vertexPositions: Array[F32] = [0.75; 0.75; 0.0; 1.0; 0.75; -0.75; 0.0; 1.0; -0.75; -0.75; 0.0; 1.0]
    	gl.BufferData(gl.TARGETARRAYBUFFER(), vertexPositions.space().isize(), vertexPositions, gl.USAGESTATICDRAW())
    	Debug.out("error3 = ".add(gl.GetError().string()))
    	
    	positionBufferObject = Array[gl.UINT]
    	try gl.BindBuffer(gl.TARGETARRAYBUFFER(), positionBufferObject(0)?) end
        Debug.out("error4 = ".add(gl.GetError().string()))
        
        var vao: Array[gl.UINT] = [0]
        gl.GenVertexArrays(1, vao)
        Debug.out("error5 = ".add(gl.GetError().string()))
        
        try Debug.out("vao = ".add(vao(0)?.string())) end
        
	    try gl.BindVertexArray(vao(0)?) end
	    Debug.out("error6 = ".add(gl.GetError().string()))
	    
        while glfw.WindowShouldClose(window) == 0 do
            gl.ClearColor(0.0, 0.0, 0.0, 0.0)
            gl.Clear(gl.MASKCOLORBUFFERBIT())
            Debug.out("error7 = ".add(gl.GetError().string()))
            
            //gl.UseProgram(theProgram)
            
            try gl.BindBuffer(gl.TARGETARRAYBUFFER(), positionBufferObject(0)?) end
            Debug.out("error8 = ".add(gl.GetError().string()))
            
            gl.EnableVertexAttribArray(0)
            Debug.out("error9 = ".add(gl.GetError().string()))
            
            gl.VertexAttribPointer(0, 4, gl.TYPEFLOAT(), gl.BOOLEANFALSE(), 0, 0)
            Debug.out("error10 = ".add(gl.GetError().string()))
            
            //gl.DrawArrays(gl.MODETRIANGLES(), 0, 3)
            Debug.out("error11 = ".add(gl.GetError().string()))
            
            gl.DisableVertexAttribArray(0)
            gl.UseProgram(0)
            
            glfw.SwapBuffers(window)

            glfw.PollEvents()
        end
        
        glfw.Terminate()