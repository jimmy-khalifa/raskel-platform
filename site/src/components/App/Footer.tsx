import React from 'react'
import {Link} from 'gatsby'
import logo from "../../assets/images/logo.png"
import footerMap from "../../assets/images/footer-map.png"
import { useIntl } from "react-intl"

const Footer = () => {
    const intl = useIntl()
    const currentYear = new Date().getFullYear();

    return (
        <footer className="footer-area bg-color">
            <div className="container">
                <div className="row">
                    <div className="col-lg-4 col-sm-6">
                        <div className="single-footer-widget">
                            <a href="/" className="logo">
                                <img src={logo} alt="logo" />
                            </a>
                            <p>{intl.formatMessage({ id: "footermsg" })}{" "}</p>

                            <ul className="social-link">
                                <li>
                                    <Link to="https://www.facebook.com/raskeltech" className="d-block" target="_blank" rel="noreferrer">
                                        <i className='bx bxl-facebook'></i>
                                    </Link>
                                </li>
                                <li>
                                    <Link to="https://twitter.com/raskeltech" className="d-block" target="_blank" rel="noreferrer">
                                        <i className='bx bxl-twitter'></i>
                                    </Link>
                                </li>
                                <li>
                                    <Link to="https://www.instagram.com/raskeltech" className="d-block" target="_blank" rel="noreferrer">
                                        <i className='bx bxl-instagram'></i>
                                    </Link>
                                </li>
                                <li>
                                    <Link to="https://www.linkedin.com/company/raskeltech" className="d-block" target="_blank" rel="noreferrer">
                                        <i className='bx bxl-linkedin'></i>
                                    </Link>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div className="col-lg-2 col-sm-6">
                        <div className="single-footer-widget pl-5">
                            <h3>{intl.formatMessage({ id: "footerexplore" })}{" "}</h3>
                            
                            <ul className="footer-links-list">
                                <li>
                                    <Link to="/#">
                                    {intl.formatMessage({ id: "home" })}{" "}
                                    </Link>
                                </li>
                                <li>
                                    <Link to="/#contact">
                                    {intl.formatMessage({ id: "contact" })}{" "}
                                    </Link>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div className="col-lg-2 col-sm-6">
                        <div className="single-footer-widget">
                            <h3>{intl.formatMessage({ id: "services" })}{" "}</h3>

                            <ul className="footer-links-list">
                                <li>
                                    <Link to="/#platform">
                                    {intl.formatMessage({ id: "theplatform" })}{" "}
                                    </Link>
                                </li>
                                <li>
                                    <Link to="/#services">
                                    {intl.formatMessage({ id: "services" })}{" "}
                                    </Link>
                                </li>
                                <li>
                                    <Link to="/#team">
                                    {intl.formatMessage({ id: "theteam" })}{" "}
                                    </Link>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div className="col-lg-4 col-sm-6">
                        <div className="single-footer-widget">
                            <h3>{intl.formatMessage({ id: "address" })}{" "}</h3>

                            <ul className="footer-contact-info">
                                <li>
                                    <i className='bx bx-map'></i> 
                                    {intl.formatMessage({ id: "addresslocation" })}{" "} <br /> {intl.formatMessage({ id: "addresscountry" })}{" "}
                                </li>
                                <li>
                                    <i className='bx bx-phone-call'></i>
                                    <a href="tel:+44587154756">(+216) 55 767 884</a>
                                </li>
                                <li>
                                    <i className='bx bx-envelope'></i>
                                    <a href="mailto:hello@rewy.com">hello@raskel.tn</a>
                                </li>
                                <li>
                                    <i className='bx bxs-inbox'></i>
                                    <a href="tel:+557854578964">(+216) 55 767 884</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div className="footer-bottom-area">
                    <div className="row align-items-center">
                        <div className="col-lg-6 col-md-6">
                            <p>{intl.formatMessage({ id: "copyright" })}{" "} © {currentYear} <strong>iPalm</strong> {intl.formatMessage({ id: "copyrightreserved" })}{" "} </p>
                        </div>

                    </div>
                </div>
            </div>

            <div className="footer-map">
                <img src={footerMap} alt="footer-logo" />
            </div>
        </footer>
    );
}

export default Footer;