Prueba Técnica Fullstack - Credyty

Este repositorio contiene la solución completa a la prueba técnica fullstack para la empresa Credyty, desarrollada con:

Backend en .NET 7 (Visual Studio 2022)

Frontend en Angular 20 standalone (Bootstrap)

Base de datos SQL Server

Estructura del proyecto

/backend       → Proyecto .NET Core
/frontend      → Proyecto Angular 20 standalone
/sql           → Script SQL para la base de datos

Qué se implementó

Registro de ingreso

POST /api/parking/entry

Recibe placa, tipo de vehículo, hora de entrada

Guarda el ingreso en la base de datos

Salida y liquidación

POST /api/parking/exit

Calcula minutos, valor a pagar y aplica descuento del 30% si hay facturas

Historial de parqueo

GET /api/parking/history?start=...&end=...

Lista de vehículos con placa, tipo, tiempo y valor pagado

JSONs de prueba

Registrar ingreso

POST /api/parking/entry
{
  "plate": "ABC123",
  "vehicleType": 0,
  "entryTime": "2025-06-10T14:30:00Z"
}

Registrar salida

POST /api/parking/exit
{
  "plate": "ABC123",
  "exitTime": "2025-06-10T16:00:00Z",
  "invoiceNumbers": ["FAC-123"]
}

Consultar historial

GET /api/parking/history?start=2025-06-01T00:00:00Z&end=2025-06-10T23:59:59Z

Requisitos

.NET 7

Angular 20

SQL Server (Express o LocalDB)

Instrucciones de uso

Backend

Abre /backend en Visual Studio 2022

Verifica la cadena de conexión en appsettings.json

Ejecuta dotnet run

Frontend

cd frontend
npm install
ng serve

Base de datos

Abre SQL Server Management Studio

Ejecuta el script sql/database.sql

Entregado por

Miguel Angel Diaz Moreno Link del repositorio: https://github.com/tuusuario/parqueadero-credty-fullstackFecha de entrega: 2025-06-09
