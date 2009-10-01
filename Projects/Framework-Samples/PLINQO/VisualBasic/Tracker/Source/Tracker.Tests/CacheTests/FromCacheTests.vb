﻿Imports System
Imports System.Linq
Imports System.Web
Imports CodeSmith.Data.Linq
Imports NUnit.Framework
Imports Tracker.Core.Data

Namespace Tracker.Tests.CacheTests
    <TestFixture()> _
    Public Class FromCacheTests
        Inherits RoleTests
        <Test()> _
        Public Sub SimpleTest()
            Try
                Using db = New TrackerDataContext()
                    Dim query = db.Role.Where(Function(r) r.Name = "Test Role")
                    Dim key = query.GetKey()
                    Dim roles = query.FromCache()

                    Dim cache = HttpRuntime.Cache.[Get](key)
                    Assert.IsNotNull(cache)
                    Assert.AreSame(roles, cache)
                End Using
            Catch generatedExceptionName As AssertionException
                Throw
            Catch
                Assert.Fail()
            End Try
        End Sub

        <Test()> _
        Public Sub DurationTest()
            Try
                Using db = New TrackerDataContext()
                    Dim query = db.Role.Where(Function(r) r.Name = "Test Role")
                    Dim key = query.GetKey()
                    Dim roles = query.FromCache(2)

                    Dim cache1 = HttpRuntime.Cache.[Get](key)
                    Assert.IsNotNull(cache1)
                    Assert.AreSame(roles, cache1)

                    System.Threading.Thread.Sleep(2500)

                    Dim cache2 = HttpRuntime.Cache.[Get](key)
                    Assert.IsNull(cache2)
                End Using
            Catch generatedExceptionName As AssertionException
                Throw
            Catch
                Assert.Fail()
            End Try
        End Sub

        <Test()> _
        Public Sub AbsoluteExpirationTest()
            Try
                Using db = New TrackerDataContext()
                    Dim query = db.Role.Where(Function(r) r.Name = "Test Role")
                    Dim key = query.GetKey()
                    Dim roles = query.FromCache(DateTime.UtcNow.AddSeconds(2))

                    Dim cache1 = HttpRuntime.Cache.[Get](key)
                    Assert.IsNotNull(cache1)
                    Assert.AreSame(roles, cache1)

                    System.Threading.Thread.Sleep(2500)

                    Dim cache2 = HttpRuntime.Cache.[Get](key)
                    Assert.IsNull(cache2)
                End Using
            Catch generatedExceptionName As AssertionException
                Throw
            Catch
                Assert.Fail()
            End Try
        End Sub

        <Test()> _
        Public Sub SlidingExpirationTest()
            Try
                Using db = New TrackerDataContext()
                    Dim query = db.Role.Where(Function(r) r.Name = "Test Role")
                    Dim key = query.GetKey()
                    Dim roles = query.FromCache(New TimeSpan(0, 0, 2))

                    Dim cache1 = HttpRuntime.Cache.[Get](key)
                    Assert.IsNotNull(cache1)
                    Assert.AreSame(roles, cache1)

                    System.Threading.Thread.Sleep(1500)

                    Dim cache2 = HttpRuntime.Cache.[Get](key)
                    Assert.IsNotNull(cache2)
                    Assert.AreSame(roles, cache2)

                    System.Threading.Thread.Sleep(1500)

                    Dim cache3 = HttpRuntime.Cache.[Get](key)
                    Assert.IsNotNull(cache3)
                    Assert.AreSame(roles, cache3)

                    System.Threading.Thread.Sleep(2500)

                    Dim cache4 = HttpRuntime.Cache.[Get](key)
                    Assert.IsNull(cache4)
                End Using
            Catch generatedExceptionName As AssertionException
                Throw
            Catch
                Assert.Fail()
            End Try
        End Sub

        <Test()> _
        Public Sub CacheEmptyResultTest()
            Try
                Using db = New TrackerDataContext()
                    Dim query = db.Role.Where(Function(r) r.Name = System.Guid.NewGuid().ToString())
                    Dim key = query.GetKey()
                    Dim roles = query.FromCache(New CacheSettings())

                    Assert.IsNotNull(roles)
                    Assert.AreEqual(0, roles.Count())

                    Dim cache = HttpRuntime.Cache.[Get](key)
                    Assert.IsNull(cache)
                End Using
            Catch generatedExceptionName As AssertionException
                Throw
            Catch
                Assert.Fail()
            End Try
        End Sub
    End Class
End Namespace