import useFormulario from './hooks/useFormulario'
import Input from './components/Input'
import Card from './components/Card'
import Alert from './components/Alert'
import Container from './components/Container'
import Button from './components/Button'
import { useEffect, useState, useRef } from 'react'

function App() {
  const [ usuarios, setUsuarios ] = useState([])
  const [ usuario, setUsuario ] = useState([])
  const [ newName, setnewName ] = useState('')
  const [ showInput, setshowInput ] = useState(false)
  const [ alert, setAlert ] = useState(false)
  const [formulario, handleChange, reset] = useFormulario({ 
    email: ''
  })
  const inputRef = useRef()
  const submit = async (e) => {
    e.preventDefault();
    const result = await fetch('http://localhost:3000/api/searchUserEmail', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(formulario)
    })
    const resultInJson = await result.json()
    if (resultInJson.user){
      setshowInput(true)
      setUsuario(resultInJson.user)
      setnewName(resultInJson.user.name)
      setAlert(false)
    }
    else {
      setAlert(true)
      reset()
    }
  }
  const changeName = async (e) => {
    e.preventDefault();
    const new_name = { id: usuario.id, name: newName }
    const result = await fetch('http://localhost:3000/api/changeUserName', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(new_name)
    })
    setshowInput(false)
    setnewName('')
  }
  useEffect(() => {
    const fetchData = async () => {
      const result = await fetch('http://localhost:3000/api/getUserList')
      const jsonreulst = await result.json()
      setUsuarios(jsonreulst.users)
    }
    fetchData()
  }, [])
  return (
    <div style={{marginTop: '15%'}}>
      <Container>
        <Card>
          <div style={{padding: 20}}>
            <form onSubmit={submit}>
              <Input 
                label="Buscar Usuario con Correo" 
                name="email"
                value={formulario.email}
                onChange={handleChange}
              />
              { alert ? <Alert/> : null }
              <Button>Buscar</Button>
            </form>
          </div>
        </Card>
        { showInput ? 
          <Card>
            <div style={{padding: 20}}>
              <form onSubmit={changeName}>
                <Input 
                  label="Cambiar Nombre" 
                  name="name_user"
                  value={newName}
                  onChange={(e) => setnewName(e.target.value)}
                />
                <Button>Cambiar</Button>
              </form>
            </div>
          </Card>
          : null
        }
        <Card>
          <div style={{padding: 20}}>
            <h2>Lista usuarios</h2>
            <ul>
              { usuarios.map(x => 
                <li key={x.id}>{`${x.name} - ${x.email}`}</li>
              )}
            </ul>
          </div>
        </Card>
      </Container>
    </div>
  );
}
export default App;
