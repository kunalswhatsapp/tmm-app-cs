using System;

namespace CatalystFacade
{
    public class SurveyTypeUpdateArgs : EventArgs
    {
        public SurveyTypeUpdateArgs(SurveyType surveyType)
        {
            SurveyType = surveyType;
           
        }

        public SurveyType SurveyType { get; }
    }
}