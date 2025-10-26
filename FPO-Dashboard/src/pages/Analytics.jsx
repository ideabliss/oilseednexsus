import { useState } from 'react'

export default function Analytics() {
  const [timeRange, setTimeRange] = useState('30d')
  
  const priceData = [
    { crop: 'Soybean', currentPrice: 55, prediction: 58, change: '+5.4%', trend: 'up' },
    { crop: 'Mustard', currentPrice: 62, prediction: 59, change: '-4.8%', trend: 'down' },
    { crop: 'Groundnut', currentPrice: 65, prediction: 68, change: '+4.6%', trend: 'up' },
    { crop: 'Sesame', currentPrice: 85, prediction: 87, change: '+2.3%', trend: 'up' },
  ]

  const performanceMetrics = {
    totalProcurement: '2,450 tons',
    averagePrice: '₹58/kg',
    farmerSatisfaction: '94%',
    deliveryEfficiency: '96%'
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Analytics & Insights</h1>
          <p className="text-gray-600">AI-powered market analysis and performance metrics</p>
        </div>
        <div className="flex space-x-3">
          <select
            value={timeRange}
            onChange={(e) => setTimeRange(e.target.value)}
            className="border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-primary-500 focus:border-transparent"
          >
            <option value="7d">Last 7 days</option>
            <option value="30d">Last 30 days</option>
            <option value="90d">Last 3 months</option>
            <option value="1y">Last year</option>
          </select>
          <button className="bg-primary-500 text-white px-4 py-2 rounded-lg hover:bg-primary-600 transition-colors">
            Export Report
          </button>
        </div>
      </div>

      {/* Performance Overview */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <div className="flex items-center">
            <div className="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center">
              <span className="text-2xl">📦</span>
            </div>
            <div className="ml-4">
              <p className="text-sm font-medium text-gray-600">Total Procurement</p>
              <p className="text-2xl font-bold text-gray-900">{performanceMetrics.totalProcurement}</p>
              <p className="text-sm text-green-600">+12% from last month</p>
            </div>
          </div>
        </div>

        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <div className="flex items-center">
            <div className="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center">
              <span className="text-2xl">💰</span>
            </div>
            <div className="ml-4">
              <p className="text-sm font-medium text-gray-600">Average Price</p>
              <p className="text-2xl font-bold text-gray-900">{performanceMetrics.averagePrice}</p>
              <p className="text-sm text-green-600">+3.2% from last month</p>
            </div>
          </div>
        </div>

        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <div className="flex items-center">
            <div className="w-12 h-12 bg-yellow-100 rounded-lg flex items-center justify-center">
              <span className="text-2xl">😊</span>
            </div>
            <div className="ml-4">
              <p className="text-sm font-medium text-gray-600">Farmer Satisfaction</p>
              <p className="text-2xl font-bold text-gray-900">{performanceMetrics.farmerSatisfaction}</p>
              <p className="text-sm text-green-600">+2% from last month</p>
            </div>
          </div>
        </div>

        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <div className="flex items-center">
            <div className="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center">
              <span className="text-2xl">🚛</span>
            </div>
            <div className="ml-4">
              <p className="text-sm font-medium text-gray-600">Delivery Efficiency</p>
              <p className="text-2xl font-bold text-gray-900">{performanceMetrics.deliveryEfficiency}</p>
              <p className="text-sm text-green-600">+1.5% from last month</p>
            </div>
          </div>
        </div>
      </div>

      {/* Price Predictions */}
      <div className="bg-white rounded-lg shadow-sm border border-gray-200">
        <div className="px-6 py-4 border-b border-gray-200">
          <div className="flex items-center justify-between">
            <h2 className="text-lg font-semibold text-gray-900">AI Price Predictions</h2>
            <span className="text-sm text-gray-500">Next 30 days forecast</span>
          </div>
        </div>
        <div className="p-6">
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
            {priceData.map((item) => (
              <div key={item.crop} className="bg-gray-50 p-4 rounded-lg">
                <div className="flex items-center justify-between mb-2">
                  <h3 className="font-medium text-gray-900">{item.crop}</h3>
                  <span className={`text-sm font-semibold ${
                    item.trend === 'up' ? 'text-green-600' : 'text-red-600'
                  }`}>
                    {item.trend === 'up' ? '📈' : '📉'} {item.change}
                  </span>
                </div>
                <div className="space-y-1">
                  <div className="flex justify-between">
                    <span className="text-sm text-gray-600">Current</span>
                    <span className="text-sm font-medium">₹{item.currentPrice}/kg</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-sm text-gray-600">Predicted</span>
                    <span className="text-sm font-medium text-primary-600">₹{item.prediction}/kg</span>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Procurement Trends */}
        <div className="bg-white rounded-lg shadow-sm border border-gray-200">
          <div className="px-6 py-4 border-b border-gray-200">
            <h2 className="text-lg font-semibold text-gray-900">Procurement Trends</h2>
          </div>
          <div className="p-6">
            <div className="bg-gray-100 rounded-lg h-64 flex items-center justify-center">
              <div className="text-center text-gray-500">
                <span className="text-4xl mb-2 block">📊</span>
                <p>Interactive chart showing procurement volume over time</p>
                <p className="text-sm">Integration with Chart.js / Recharts</p>
              </div>
            </div>
          </div>
        </div>

        {/* Farmer Engagement */}
        <div className="bg-white rounded-lg shadow-sm border border-gray-200">
          <div className="px-6 py-4 border-b border-gray-200">
            <h2 className="text-lg font-semibold text-gray-900">Farmer Engagement</h2>
          </div>
          <div className="p-6">
            <div className="space-y-4">
              <div className="flex items-center justify-between">
                <span className="text-sm font-medium text-gray-900">Active Farmers</span>
                <span className="text-sm text-gray-600">1,247 / 1,500</span>
              </div>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div className="bg-primary-500 h-2 rounded-full" style={{ width: '83%' }}></div>
              </div>

              <div className="flex items-center justify-between">
                <span className="text-sm font-medium text-gray-900">Repeat Sellers</span>
                <span className="text-sm text-gray-600">892 / 1,247</span>
              </div>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div className="bg-green-500 h-2 rounded-full" style={{ width: '71%' }}></div>
              </div>

              <div className="flex items-center justify-between">
                <span className="text-sm font-medium text-gray-900">New Registrations</span>
                <span className="text-sm text-gray-600">45 this month</span>
              </div>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div className="bg-blue-500 h-2 rounded-full" style={{ width: '60%' }}></div>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Market Intelligence */}
      <div className="bg-white rounded-lg shadow-sm border border-gray-200">
        <div className="px-6 py-4 border-b border-gray-200">
          <h2 className="text-lg font-semibold text-gray-900">Market Intelligence</h2>
        </div>
        <div className="p-6">
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div className="text-center">
              <div className="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-4">
                <span className="text-3xl">🎯</span>
              </div>
              <h3 className="text-lg font-semibold text-gray-900 mb-2">Demand Forecast</h3>
              <p className="text-gray-600 text-sm mb-4">AI predicts 15% increase in soybean demand next quarter</p>
              <button className="text-primary-600 hover:text-primary-700 text-sm font-medium">
                View Details →
              </button>
            </div>

            <div className="text-center">
              <div className="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
                <span className="text-3xl">🌾</span>
              </div>
              <h3 className="text-lg font-semibold text-gray-900 mb-2">Crop Recommendations</h3>
              <p className="text-gray-600 text-sm mb-4">Suggest mustard cultivation for upcoming Rabi season</p>
              <button className="text-primary-600 hover:text-primary-700 text-sm font-medium">
                View Details →
              </button>
            </div>

            <div className="text-center">
              <div className="w-16 h-16 bg-yellow-100 rounded-full flex items-center justify-center mx-auto mb-4">
                <span className="text-3xl">⚡</span>
              </div>
              <h3 className="text-lg font-semibold text-gray-900 mb-2">Market Alerts</h3>
              <p className="text-gray-600 text-sm mb-4">Price volatility expected in groundnut market this week</p>
              <button className="text-primary-600 hover:text-primary-700 text-sm font-medium">
                View Details →
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}