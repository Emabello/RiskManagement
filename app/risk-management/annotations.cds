using RiskService as service from '../../srv/risk-service';
annotate service.Risks with @(
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>RiskOverview}',
            ID : 'RiskOverview',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>RiskDetails}',
                    ID : 'RiskDetails',
                    Target : '@UI.FieldGroup#RiskDetails',
                },],
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>MitigationOverview}',
            ID : 'MitigationOverview',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>MitigationDetails}',
                    ID : 'MitigationDetails',
                    Target : '@UI.FieldGroup#MitigationDetails',
                },],
        },],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Title}',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Value : miti.descr,
            Label : '{i18n>Mitigation1}',
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Owner}',
            Value : owner,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Priocode}',
            Value : prio_code,
            Criticality : PrioCriticality,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Impact}',
            Value : impact,
            Criticality : criticality,
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : 'bp/@Communication.Contact#contact1',
            Label : '{i18n>BusinessPartner}tner',
        },
    ],
);

annotate service.Risks with @(
    UI.SelectionFields : [
        prio_code,
    ]
);
annotate service.Risks with {
    prio @Common.Label : '{i18n>Priority}'
};
annotate service.Risks with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : descr,
        },
        TypeImageUrl : 'sap-icon://alert',
    }
);
annotate service.Risks with @(
    UI.FieldGroup #RiskDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
                Label : '{i18n>Title}',
            },{
                $Type : 'UI.DataField',
                Value : owner,
                Label : '{i18n>Owner}',
            },{
                $Type : 'UI.DataField',
                Value : descr,
                Label : '{i18n>Descr}',
            },{
                $Type : 'UI.DataField',
                Value : prio_code,
                Label : '{i18n>Priority}',
                Criticality : PrioCriticality,
            },{
                $Type : 'UI.DataField',
                Value : impact,
                Label : '{i18n>Impact}',
                Criticality : criticality,
            },
            {
                $Type : 'UI.DataFieldForAnnotation',
                Target : 'bp/@Communication.Contact#contact2',
                Label : '{i18n>BusinessPartner}tner',
            },],
    }
);
annotate service.Risks with @(
    UI.FieldGroup #MitigationDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : miti_ID,
                Label : '{i18n>Mitigation3}',
            },{
                $Type : 'UI.DataField',
                Value : miti.owner,
                Label : '{i18n>Owner}',
            },{
                $Type : 'UI.DataField',
                Value : miti.timeline,
                Label : '{i18n>Timeline}',
            },],
    }
);
annotate service.Risks with {
    miti @Common.Text : {
            $value : miti.descr,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.Risks with {
    miti @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Mitigations',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : miti_ID,
                    ValueListProperty : 'ID',
                },
            ],
            Label : '{i18n>Mitigation2}',
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Mitigations with {
    ID @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
annotate service.Mitigations with {
    owner @Common.FieldControl : #ReadOnly
};
annotate service.Mitigations with {
    timeline @Common.FieldControl : #ReadOnly
};
annotate service.Risks with {
    prio @Common.Text : {
            $value : prio.descr,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.Risks with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : bp_BusinessPartner,
    }
);
annotate service.BusinessPartners with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    }
);
annotate service.BusinessPartners with @(
    Communication.Contact #contact1 : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    }
);
annotate service.BusinessPartners with @(
    Communication.Contact #contact2 : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    }
);
