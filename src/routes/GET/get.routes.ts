import express from 'express'
import { getUsers } from '../../controllers/auth.controller';


const getRoutes = express.Router();


getRoutes.get('/user', getUsers);


export default getRoutes;