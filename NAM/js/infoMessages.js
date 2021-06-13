function wrongEmail() {
    Swal.fire({
        icon: 'error',
        title: 'Oops...',
        text: 'Ditt e-post existerar inte i NAM system!',
        footer: '<a href="SignUp.aspx">Skapa ett konto?</a>'
    })
}

function wrongUsername() {
    Swal.fire({
        icon: 'error',
        title: 'Oops...',
        text: 'Ditt användarnamn existerar inte i NAM system!',
        footer: '<a href="SignUp.aspx">Skapa ett konto?</a>'
    })
}

function emptyFields() {
    Swal.fire({
        icon: 'error',
        title: 'Oops...',
        text: 'Var vänlig och fyll i alla fälten!'
     })
}
 
 
function logOut() {
    Swal.fire('Du kommer att loggas ut!')
}

function sendMessage() {
    Swal.fire(
        'Tack så mycket!',
        'Ditt meddelande har skickats!',
        'success'
    )
}

function wrongEmail_Pass() {
    Swal.fire({
        icon: 'error',
        title: 'Oops...',
        text: 'Fel e-post eller lösenord!',
     })
}

function emailExist() {
    Swal.fire({
        icon: 'error',
        title: 'Oops...',
        text: 'E-posten finns redan!',
        footer: '<a href="LogIn.aspx">Logga in?</a>'
    })
}

function usernameExist() {
    Swal.fire({
        icon: 'error',
        title: 'Oops...',
        text: 'Användarnmanet finns redan!',
        footer: '<a href="LogIn.aspx">Logga in?</a>'
    })
}


function doneInput() {
    Swal.fire({
        icon: 'info',
        title: 'Oops...',
        text: 'Your parameters has been saved, we are generating suggestions for you.\nYou can find them att my planning page!',
        footer: '<a href="myPlanning.aspx">My planning</a>'
    })
}


  function wrongExtesnion() {
    Swal.fire({
        icon: 'error',
        title: 'Oops...',
        text: 'Wrong picture exstension!',
    })
}

 




 

