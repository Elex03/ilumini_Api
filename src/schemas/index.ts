import {z} from 'zod'

export const userSchema = z.object({
    correo: z.string().email(), 
    contrasena: z.string(),
})