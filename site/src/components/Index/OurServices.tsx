import React from 'react'
//import service1 from '../../assets/images/services/service1.png'
//import service2 from '../../assets/images/services/service2.png'
import service1 from '../../assets/images/raskel_cover_2.png'
import service2 from '../../assets/images/raskel-green-city.png'
import starIcon from '../../assets/images/star-icon.png'
import { useIntl } from "react-intl"

const OurServices = () => {
    const intl = useIntl()
    return (
        <React.Fragment>
            {/* Service Right Image Style */}
            <div id="services" className="our-mission-area pb-100">
                <div className="container-fluid">
                    <div className="row align-items-center">
                        <div className="col-lg-6 col-md-12">
                            <div className="our-mission-content">
                                <div className="content">
                                    <span className="sub-title">
                                        <img src={starIcon} alt="icon" /> {intl.formatMessage({ id: "services" })}{" "}
                                    </span>
                                    
                                    <h2>{intl.formatMessage({ id: "fastandsimple" })}{" "}</h2>
                                    <p>{intl.formatMessage({ id: "fastandsimplemsg" })}{" "}</p>

                                    <ul className="our-mission-list mb-0">
                                        <li>
                                            <i className="flaticon-tick"></i>
                                            {intl.formatMessage({ id: "collect" })}{" "}
                                        </li>
                                        <li>
                                            <i className="flaticon-tick"></i>
                                            {intl.formatMessage({ id: "collection" })}{" "}
                                        </li>
                            
                                        <li>
                                            <i className="flaticon-tick"></i>
                                            {intl.formatMessage({ id: "destruction" })}{" "}
                                        </li>
                                        <li>
                                            <i className="flaticon-tick"></i>
                                            {intl.formatMessage({ id: "recycle" })}{" "}
                                        </li>
                                        <li>
                                            <i className="flaticon-tick"></i>
                                            {intl.formatMessage({ id: "reuse" })}{" "}
                                        </li>
                                        <li>
                                            <i className="flaticon-tick"></i>
                                            {intl.formatMessage({ id: "sale" })}{" "}
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div className="col-lg-6 col-md-12">
                            <div className="our-mission-image">
                                <img src={service2} alt="service" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {/* End Service Right Image Style */}
            {/* Service Left Image Style */}
            <div className="about-area pb-100">
                <div className="container-fluid">
                    <div className="row align-items-center">
                        <div className="col-lg-6 col-md-12">
                            <div className="about-img">
                                <img src={service1} alt="service" />
                            </div>
                        </div>

                        <div className="col-lg-6 col-md-12">
                            <div className="about-content">
                                <div className="content">
                                    <span className="sub-title">
                                        <img src={starIcon} alt="icon" /> {intl.formatMessage({ id: "services" })}{" "}
                                    </span>
                                    
                                    <h2>{intl.formatMessage({ id: "greeneco" })}{" "}</h2>
                                    <p>{intl.formatMessage({ id: "greenecomsg" })}{" "}</p>
                                    <ul className="about-list mb-0">
                                        <li>
                                            <i className="flaticon-tick"></i>
                                            {intl.formatMessage({ id: "awareness" })}{" "}
                                        </li>
                                        <li>
                                            <i className="flaticon-tick"></i>
                                            {intl.formatMessage({ id: "contactwith" })}{" "}
                                        </li>
                                        <li>
                                            <i className="flaticon-tick"></i>
                                            {intl.formatMessage({ id: "collaboration" })}{" "}
                                        </li>
                                        <li>
                                            <i className="flaticon-tick"></i>
                                            {intl.formatMessage({ id: "connection" })}{" "}
                                        </li>
                                        <li>
                                            <i className="flaticon-tick"></i>
                                            {intl.formatMessage({ id: "partnership" })}{" "}
                                        </li>
                                        <li>
                                            <i className="flaticon-tick"></i>
                                            {intl.formatMessage({ id: "interaction" })}{" "}
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {/* End Service Left Image Style */}

        </React.Fragment>
    )
}

export default OurServices;