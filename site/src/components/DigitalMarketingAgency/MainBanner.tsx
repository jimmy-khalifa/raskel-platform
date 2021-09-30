import React from 'react'
//import {Link} from 'gatsby'
import ReactWOW from 'react-wow'
import bannerImg3 from '../../assets/images/banner-img3.png'
import { useIntl } from "react-intl"
import { LocalizedLink as Link } from "gatsby-theme-i18n"

const MainBanner = () => {
    const intl = useIntl()
    return (
        <div className="digital-agency-banner">
            <div className="container">
                <div className="row align-items-center">
                    <div className="col-lg-6 col-md-12">
                        <div className="banner-wrapper-content">
                            <span className="sub-title">{intl.formatMessage({ id: "digitalmarketing" })}{" "}</span>
                            <ReactWOW delay='.1s' animation='fadeInLeft'>
                                <h1>{intl.formatMessage({ id: "digitalagencyexellence" })}{" "}</h1>
                            </ReactWOW>

                            <ReactWOW delay='.1s' animation='fadeInLeft'>
                                <p>{intl.formatMessage({ id: "digitalagencyexellencetxt" })}{" "}</p>
                            </ReactWOW>

                            <ReactWOW delay='.1s' animation='fadeInRight'>
                                <div className="btn-box">
                                    <Link to="/about-us" className="default-btn">
                                        <i className="flaticon-right"></i> 
                                        {intl.formatMessage({ id: "aboutus" })}{" "}
                                        <span></span>
                                    </Link>
                                </div>
                            </ReactWOW>
                        </div>
                    </div>

                    <div className="col-lg-6 col-md-12">
                        <ReactWOW delay='.1s' animation='fadeInUp'>
                            <div className="banner-wrapper-image">
                                <img src={bannerImg3} alt="banner" />
                            </div>
                        </ReactWOW>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default MainBanner
