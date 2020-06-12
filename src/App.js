import React,  { useState, useEffect } from 'react';
import axios from 'axios';
import './App.css';
import config from './config/environ';

function App() {
  const [ people, setPeople ] = useState([]);
  useEffect(() => {
    const axiosInstanceConfig = axios.create({ baseURL: config.baseURL });

    axiosInstanceConfig.get('/people')
    .then((response) => {
      setPeople(response.data);
    })
    .catch((error) => {
      console.error(error);
      throw new Error('Fail to obtain the people data');
    });
  }, [])

  function renderTable(people) {
    return people
      .map((person, index) => (
        <tr key={index}>
          <td>{person.firstName}</td>
          <td>{person.lastName}</td>
          <td>{person.email}</td>
        </tr>
      ))
  }
  
  return (
    <div className="App">
      <table>
        <thead>
          <tr>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Email</th>
          </tr>
        </thead>
        <tbody>
          {renderTable(people)}
        </tbody>
      </table>
    </div>
  );
}

export default App;
