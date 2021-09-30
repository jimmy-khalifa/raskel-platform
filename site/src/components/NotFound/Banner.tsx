import React from 'react'
import ReactWOW from 'react-wow'
import bannerImg from '../../assets/images/error.png'
import { useIntl } from "react-intl"

const Banner = () => {
    const intl = useIntl()
    return (
        <div className="it-services-banner">
            <div className="container">
                <div className="row align-items-center">
                    <div className="col-lg-6 col-md-12">
                        <div className="main-banner-content">
                            <ReactWOW delay='.1s' animation='fadeInLeft'>
                                <h1>{intl.formatMessage({ id: "notfound" })}{" "}</h1>
                            </ReactWOW>

                            <ReactWOW delay='.1s' animation='fadeInLeft'>
                                <p>{intl.formatMessage({ id: "notfoundmsg" })}{" "}</p>
                            </ReactWOW>

                            {/*<ReactWOW delay='.1s' animation='fadeInRight'>
                                <div className="btn-box">
                                    <Link to="/contact" className="default-btn">
                                        <i className="flaticon-right"></i> 
                                        {intl.formatMessage({ id: "getstarted" })}{" "} <span></span>
                                    </Link>
                                </div>
                            </ReactWOW>*/}
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