// src/main/webapp/js/app.js


function Navbar() {
    return (
        <div className="navbar">
            <div className="navContainer">
                <span className="logo">Futel</span>
                <div className="navIteams">
                    <button className="navButton">Login</button>
                    <button className="navButton">Register</button>
                </div>

            </div>
            <div className=""></div>
            <div className=""></div>
            <div className=""></div>
        </div>
    )
}

const Header = () => {
    return (
        <div className="header">
            <div className="headerContainer">
                <div className="headerList">
                    <div className="headerListItem active">
                        <img src="fontawesome-free-6.5.2-desktop/fontawesome-free-6.5.2-desktop/svgs/solid/bed.svg " width="30" height="20" />
                        <span>Stay</span>
                    </div>
                    <div className="headerListItem">
                        <img src="fontawesome-free-6.5.2-desktop/fontawesome-free-6.5.2-desktop/svgs/solid/plane.svg" width="30" height="20" />
                        <span>Flights</span>
                    </div>
                    <div className="headerListItem">
                        <img src="fontawesome-free-6.5.2-desktop/fontawesome-free-6.5.2-desktop/svgs/solid/Car.svg " width="30" height="20" />
                        <span>Car rentals</span>
                    </div>
                    <div className="headerListItem">
                        <img src="fontawesome-free-6.5.2-desktop/fontawesome-free-6.5.2-desktop/svgs/solid/A.svg " width="30" height="20" />
                        <span>Attraction</span>
                    </div>
                    <div className="headerListItem">
                        <img src="fontawesome-free-6.5.2-desktop/fontawesome-free-6.5.2-desktop/svgs/solid/Taxi.svg " width="30" height="20" />
                        <span>Taxi</span>
                    </div>
                </div>
                <h1 className="headerTitle">Minh K17, kế tiếp bạn sẽ du lịch đến đâu?</h1>
                <p className="headerDesc">Lginnow</p>
                <button className="headerBtn">Sign on/ Register</button>
                <div className="headerSreach">
                    <div className="headerSearchIteam">
                        <img src="fontawesome-free-6.5.2-desktop/fontawesome-free-6.5.2-desktop/svgs/solid/bed.svg " width="30" height="20" />
                        <input type="text" placeholder="Where are you going?" className="headerSearchInput"></input>
                    </div>
                    <div className="headerSearchIteam">
                        <img src="fontawesome-free-6.5.2-desktop/fontawesome-free-6.5.2-desktop/svgs/solid/calendar-days.svg " width="30" height="20" />
                        <span className="headerSearchText">date to date?</span>
                    </div>
                    <div className="headerSearchIteam">
                        <img src="fontawesome-free-6.5.2-desktop/fontawesome-free-6.5.2-desktop/svgs/solid/person.svg " width="30" height="20" />
                        <span className="headerSearchText">2 adults 2 children 1 room</span>
                    </div>
                    <div className="headerSearchIteam">
                        <button className="headerBtn">Sign on/ Register</button>
                    </div>
                </div>
            </div>
        </div>
    )
}




// =============================================
function Rnavbar() {
    return (
        <Navbar />
    )
}
function Rheader() {
    return (
        <Header />
    )
}


ReactDOM.render(<Rnavbar />, document.getElementById('navbar'));

ReactDOM.render(<Rheader />, document.getElementById('header'));

