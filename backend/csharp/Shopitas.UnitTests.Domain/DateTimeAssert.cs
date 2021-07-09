using System;
using Xunit;

namespace Shopitas.UnitTests.Domain
{
    public class DateTimeAssert
    {
        public static void Equal(DateTime expected, DateTime actual, TimeSpan tolerance)
        {
            Assert.True(expected - actual < tolerance);
        }
    }
}