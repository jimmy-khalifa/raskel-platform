import React from 'react'
import {Link} from 'gatsby'
import starIcon from '../../assets/images/star-icon.png'
import team5 from '../../assets/images/team/team5.jpg'
import team6 from '../../assets/images/team/team6.jpg'
import team7 from '../../assets/images/team/team7.jpg'
import { useIntl } from "react-intl"

const TeamMembers = () => {
    const intl = useIntl()
    return (
        <section id="team" className="scientist-area pb-70">
            <div className="container">
                <div className="section-title">
                    <span className="sub-title">
                        <img src={starIcon} alt="banner" /> 
                        {intl.formatMessage({ id: "theteam" })}{" "}
                    </span>
                    <h2>{intl.formatMessage({ id: "team" })}{" "}</h2>
                    <p>{intl.formatMessage({ id: "teamtxt" })}{" "}</p>
                </div>

                <div className="row">
                    <div className="col-lg-3 col-sm-6 offset-lg-0 offset-sm-3">
                        <div className="single-scientist-box">
                            <div className="image">
                                <img src={team5} alt="banner" />
                            </div>
                            <div className="content">
                                <h3>{intl.formatMessage({ id: "warda" })}{" "}</h3>
                                <span>{intl.formatMessage({ id: "wardatxt" })}{" "}</span>

                                <ul className="social">
                                    <li>
                                        <Link to="#" className="d-block">
                                            <i className='bx bxl-facebook'></i>
                                        </Link>
                                    </li>
                                    <li>
                                        <Link to="#" className="d-block">
                                            <i className='bx bxl-twitter'></i>
                                        </Link>
                                    </li>
                                    <li>
                                        <Link to="#" className="d-block">
                                            <i className='bx bxl-instagram'></i>
                                        </Link>
                                    </li>
                                    <li>
                                        <Link to="#" className="d-block">
                                            <i className='bx bxl-linkedin'></i>
                                        </Link>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div className="col-lg-3 col-sm-6 offset-lg-0 offset-sm-3">
                        <div className="single-scientist-box">
                            <div className="image">
                                <img src={team6} alt="banner" />
                            </div>
                            <div className="content">
                                <h3>{intl.formatMessage({ id: "khaled" })}{" "}</h3>
                                <span>{intl.formatMessage({ id: "khaledtxt" })}{" "}</span>
                                
                                <ul className="social">
                                    <li>
                                        <Link to="#" className="d-block">
                                            <i className='bx bxl-facebook'></i>
                                        </Link>
                                    </li>
                                    <li>
                                        <Link to="#" className="d-block">
                                            <i className='bx bxl-twitter'></i>
                                        </Link>
                                    </li>
                                    <li>
                                        <Link to="#" className="d-block">
                                            <i className='bx bxl-instagram'></i>
                                        </Link>
                                    </li>
                                    <li>
                                        <Link to="#" className="d-block">
                                            <i className='bx bxl-linkedin'></i>
                                        </Link>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div className="col-lg-3 col-sm-6 offset-lg-0 offset-sm-3">
                        <div className="single-scientist-box">
                            <div className="image">
                                <img src={team7} alt="banner" />
                            </div>
                            <div className="content">
                                <h3>{intl.formatMessage({ id: "malek" })}{" "}</h3>
                                <span>{intl.formatMessage({ id: "malektxt" })}{" "}</span>
                                
                                <ul className="social">
                                    <li>
                                        <Link to="#" className="d-block">
                                            <i className='bx bxl-facebook'></i>
                                        </Link>
                                    </li>
                                    <li>
                                        <Link to="#" className="d-block">
                                            <i className='bx bxl-twitter'></i>
                                        </Link>
                                    </li>
                                    <li>
                                        <Link to="#" className="d-block">
                                            <i className='bx bxl-instagram'></i>
                                        </Link>
                                    </li>
                                    <li>
                                        <Link to="#" className="d-block">
                                            <i className='bx bxl-linkedin'></i>
                                        </Link>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div className="col-lg-3 col-sm-6 offset-lg-0 offset-sm-3">
                        <div className="single-scientist-box">
                            <div className="image">
                                <img src={team7} alt="banner" />
                            </div>
                            <div className="content">
                                <h3>{intl.formatMessage({ id: "moona" })}{" "}</h3>
                                <span>{intl.formatMessage({ id: "moonatxt" })}{" "}</span>
                                
                                <ul className="social">
                                    <li>
                                        <Link to="#" className="d-block">
                                            <i className='bx bxl-facebook'></i>
                                        </Link>
                                    </li>
                                    <li>
                                        <Link to="#" className="d-block">
                                            <i className='bx bxl-twitter'></i>
                                        </Link>
                                    </li>
                                    <li>
                                        <Link to="#" className="d-block">
                                            <i className='bx bxl-instagram'></i>
                                        </Link>
                                    </li>
                                    <li>
                                        <Link to="#" className="d-block">
                                            <i className='bx bxl-linkedin'></i>
                                        </Link>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    )
}

export default TeamMembers