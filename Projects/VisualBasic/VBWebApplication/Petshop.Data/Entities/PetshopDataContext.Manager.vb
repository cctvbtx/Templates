﻿
'------------------------------------------------------------------------------
' <autogenerated>
'     This code was generated by a CodeSmith Template.
'
'     DO NOT MODIfY contents of this file. Changes to this
'     file will be lost if the code is regenerated.
' </autogenerated>
'------------------------------------------------------------------------------

Imports System

Namespace Petshop.Data

    Partial public Class PetshopDataContext

        Private _manager As Petshop.Data.PetshopDataManager = Nothing

        ''' <summary>
        ''' Gets the data manager.
        ''' </summary>
        ''' <value>The data manager.</value>
        Public ReadOnly Property Manager As Petshop.Data.PetshopDataManager
            Get
                If _manager Is Nothing Then
                    _manager = New Petshop.Data.PetshopDataManager(Me)
                End If
                Return _manager
            End Get
        End Property

    End Class
End Namespace