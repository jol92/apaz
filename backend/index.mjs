import express from 'express'
import dotenv from 'dotenv'
import apiController from './domain/apicontroller'
// import cors from 'cors'

dotenv.config()
const { PORT, PUBLIC_URL } = process.env

const app = express()
const router = express.Router()

app.use(`${PUBLIC_URL}`, router)

router.use(express.json())

apiController(router)

app.listen(PORT, () => {
  console.log(`estamos escuchando en el puerto ${PORT}`)
})
