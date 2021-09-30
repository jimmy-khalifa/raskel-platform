import React from 'react'
import starIcon from '../../assets/images/star-icon.png'
import howitsWork from '../../assets/images/how-its-work.png'
import { useIntl } from "react-intl"

const WhyChooseUs = () => {
    const intl = useIntl()
    return (
        <section className="how-its-work-area ptb-100">
            <div className="container">
                <div className="row align-items-center">
                    <div className="col-lg-6 col-md-12">
                        <div className="how-its-work-content">
                            <span className="sub-title">
                                <img src={starIcon} alt="choose" /> 
                                {intl.formatMessage({ id: "whychooseus" })}{" "}
                            </span>
                            <h2>{intl.formatMessage({ id: "digitalexperience" })}{" "}</h2>
                            <p>{intl.formatMessage({ id: "digitalexperiencemsg" })}{" "}</p>

                            <div className="inner-box">
                                <div className="single-item">
                                    <div className="count-box">
                                        1
                                    </div>
                                    <h3>{intl.formatMessage({ id: "bestperformance" })}{" "}</h3>
                                    <p>{intl.formatMessage({ id: "bestperformancemsg" })}{" "}</p>
                                </div>
                                <div className="single-item">
                                    <div className="count-box">
                                        2
                                    </div>
                                    <h3>{intl.formatMessage({ id: "dedicatedteam" })}{" "}</h3>
                                    <p>{intl.formatMessage({ id: "dedicatedteammsg" })}{" "}</p>
                                </div>
                                <div className="single-item">
                                    <div className="count-box">
                                        3
                                    </div>
                                    <h3>{intl.formatMessage({ id: "support" })}{" "}</h3>
                                    <p>{intl.formatMessage({ id: "supportmsg" })}{" "}</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="col-lg-6 col-md-12">
                        <div className="how-its-work-image">
                            <img src={howitsWork} alt="choose" />
                        </div>
                    </div>
                </div>
            </div>
        </section>
    )
}

export default WhyChooseUs