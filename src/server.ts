import Fastify from "fastify";
import cors from '@fastify/cors';
import { routes } from "./router";

const app = Fastify({ logger: true})

app.setErrorHandler((error, request, reply) => {
    reply.code(400).send({ message: error.message})
})

const start = async () => {
    await app.register(cors, {
        origin: true  // Permite todas as origens
    });
    await app.register(routes);

    try{
        await app.listen({port: 3333})
    } catch(err){
        process.exit(1)
    }
}

start();