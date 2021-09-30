import React from 'react'
import ReactWOW from 'react-wow'
//import { Link } from 'gatsby'
import bannerImg from '../../assets/images/raskel_cover_complete_2.png'
import { useIntl } from "react-intl"
import { LocalizedLink as Link } from "gatsby-theme-i18n"

const Banner = () => {
    const intl = useIntl()
    return (
        <div className="it-services-banner">
            <div className="container">
                <div className="row align-items-center">
                    <div className="col-lg-6 col-md-12">
                        <div className="main-banner-content">
                            <ReactWOW delay='.1s' animation='fadeInLeft'>
                                <h1>{intl.formatMessage({ id: "bannertitle" })}{" "}</h1>
                            </ReactWOW>

                            <ReactWOW delay='.1s' animation='fadeInLeft'>
                                <p>{intl.formatMessage({ id: "bannermsg" })}{" "}</p>
                            </ReactWOW>

                            <ReactWOW delay='.1s' animation='fadeInRight'>
                                <div className="btn-box">
                                    <Link to="/#contact" className="default-btn">
                                        <i className="flaticon-right"></i> 
                                        {intl.formatMessage({ id: "learnmore" })}{" "} <span></span>
                                    </Link>
                                </div>
                            </ReactWOW>
                        </div>
                    </div>

                    <div className="col-lg-6 col-md-12">
                        <ReactWOW delay='.1s' animation='fadeInUp'>
                            <div className="main-banner-image">
                                <img src={bannerImg} alt="banner" />
                            </div>
                        </ReactWOW>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default Banner