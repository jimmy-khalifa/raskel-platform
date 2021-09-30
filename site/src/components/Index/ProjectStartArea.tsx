import React from 'react'
//import {Link} from 'gatsby'
import projectStart from '../../assets/images/project-start1.png'
import shape from '../../assets/images/shape/circle-shape1.png'
import { useIntl } from "react-intl"
import { LocalizedLink as Link } from "gatsby-theme-i18n"

const ProjectStartArea = () => {

    const intl = useIntl()
    return (
        <div className="project-start-area ptb-100">
            <div className="container">
                <div className="row align-items-center">
                    <div className="col-lg-6 col-md-12">
                        <div className="project-start-image">
                            <img src={projectStart} alt="project" />
                        </div>
                    </div>

                    <div className="col-lg-6 col-md-12">
                        <div className="project-start-content">
                            <h2>{intl.formatMessage({ id: "startproject" })}{" "}</h2>
                            <p>{intl.formatMessage({ id: "startprojectmsg" })}{" "}</p>
                            
                            <Link to="/contact" className="default-btn">
                                <i className="flaticon-web"></i> 
                                {intl.formatMessage({ id: "getstarted" })}{" "}
                                <span></span>
                            </Link>
                        </div>
                    </div>
                </div>
            </div>

            <div className="circle-shape1">
                <img src={shape} alt="project" />
            </div>
        </div>
    )
}

export default ProjectStartArea;