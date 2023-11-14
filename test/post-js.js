function post(){
    fetch('http://127.0.0.1:9000/imprimir',{
        method: 'POST',
        body: JSON.stringify({
            chave: 'Valor'
        })
    }).then(res => {return res.json()}).then(data => console.log(data)).catch(error => console.log('Erro'))
}